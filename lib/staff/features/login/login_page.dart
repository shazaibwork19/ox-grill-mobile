import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/brand.dart';
import '../../../core/widgets/controls.dart';
import '../../../core/widgets/panels.dart';
import '../../core/session.dart';

/// Email + password sign-in for staff and the owner. There is no
/// self-registration: accounts are created by a manager or the owner.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;
  bool _obscure = true;
  String? _error;
  Map<String, String> _fieldErrors = const {};

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_busy) return;
    setState(() {
      _error = null;
      _fieldErrors = const {};
    });
    if (!(_form.currentState?.validate() ?? false)) return;
    setState(() => _busy = true);
    try {
      await ref.read(sessionProvider.notifier).login(email: _email.text, password: _password.text);
      TextInput.finishAutofillContext();
    } catch (e) {
      final f = AppFailure.from(e);
      setState(() {
        _error = switch (f) {
          ApiFailure(statusCode: 400) when f.details.isNotEmpty => null,
          ApiFailure(statusCode: 401) ||
          ApiFailure(code: 'INVALID_CREDENTIALS') => 'Email or password is incorrect.',
          ApiFailure(statusCode: 429) => 'Too many attempts. Wait a minute and try again.',
          NetworkFailure() => '${f.userMessage} Check the connection and try again.',
          _ => f.userMessage,
        };
        if (f is ApiFailure) {
          _fieldErrors = {for (final d in f.details) d.path.replaceFirst('body.', ''): d.message};
        }
      });
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final ended = ref.read(sessionProvider.notifier).sessionEnded;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Space.x6),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: AutofillGroup(
                child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Wordmark(size: 40),
                      const SizedBox(height: Space.x1),
                      Text('STAFF', style: t.labelSmall?.copyWith(letterSpacing: 4, color: c.bronze400)),
                      const SizedBox(height: Space.x8),
                      Text('Sign in', style: t.headlineMedium),
                      const SizedBox(height: Space.x2),
                      Text(
                        'For managers, cashiers, kitchen, riders and the owner. Use the email and password your manager gave you.',
                        style: t.bodyMedium,
                      ),
                      if (ended) ...[
                        const SizedBox(height: Space.x4),
                        const InlineNotice(
                          tone: PanelTone.warning,
                          icon: Icons.lock_clock_outlined,
                          message: 'Your session ended. Please sign in again.',
                        ),
                      ],
                      const SizedBox(height: Space.x6),
                      TextFormField(
                        controller: _email,
                        enabled: !_busy,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email, AutofillHints.username],
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'e.g. manager.f7@oxgrill.test',
                          errorText: _fieldErrors['email'],
                        ),
                        validator: (v) => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch((v ?? '').trim())
                            ? null
                            : 'Enter your work email',
                      ),
                      const SizedBox(height: Space.x4),
                      TextFormField(
                        controller: _password,
                        enabled: !_busy,
                        obscureText: _obscure,
                        autofillHints: const [AutofillHints.password],
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submit(),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: _fieldErrors['password'],
                          suffixIcon: IconButton(
                            tooltip: _obscure ? 'Show password' : 'Hide password',
                            icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                            onPressed: () => setState(() => _obscure = !_obscure),
                          ),
                        ),
                        validator: (v) => (v ?? '').isEmpty ? 'Enter your password' : null,
                      ),
                      if (_error != null) ...[
                        const SizedBox(height: Space.x4),
                        Semantics(
                          liveRegion: true,
                          child: InlineNotice(
                            tone: PanelTone.danger,
                            icon: Icons.error_outline_rounded,
                            message: _error!,
                          ),
                        ),
                      ],
                      const SizedBox(height: Space.x6),
                      LoadingButton(
                        label: 'Sign in',
                        loadingLabel: 'Signing in',
                        loading: _busy,
                        onPressed: _submit,
                      ),
                      const SizedBox(height: Space.x4),
                      Text(
                        'Forgot your password? Ask your branch manager or the owner to reset it.',
                        textAlign: TextAlign.center,
                        style: t.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
