import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Typographic wordmark used until a vector logo is supplied.
class Wordmark extends StatelessWidget {
  const Wordmark({super.key, this.size = 28, this.showTagline = false});

  final double size;
  final bool showTagline;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      header: true,
      label: 'Ox and Grill Steakhouse',
      child: ExcludeSemantics(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Ox '),
                  TextSpan(
                    text: '&',
                    style: TextStyle(color: c.bronze400, fontStyle: FontStyle.italic),
                  ),
                  const TextSpan(text: ' Grill'),
                ],
              ),
              style: TextStyle(fontFamily: AppFonts.serif, fontSize: size, height: 1.1, color: c.cream50),
            ),
            if (showTagline)
              Text(
                'STEAKHOUSE',
                style: TextStyle(
                  fontFamily: AppFonts.sans,
                  fontSize: size * 0.32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: size * 0.12,
                  color: c.bronze400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
