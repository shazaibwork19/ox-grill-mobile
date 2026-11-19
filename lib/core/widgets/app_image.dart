import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Network image with a branded placeholder for loading, missing and failed images.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.url,
    required this.semanticLabel,
    this.fit = BoxFit.cover,
    this.iconSize = 32,
  });

  final String? url;

  /// Widget and screenshot tests turn this off so no network is touched.
  static bool loadNetworkImages = true;

  /// Describes the picture for screen readers (e.g. the dish name).
  final String semanticLabel;
  final BoxFit fit;
  final double iconSize;

  /// Insecure or local URLs are a backend configuration problem
  /// (`PUBLIC_API_ORIGIN`). They are not loaded: release builds forbid cleartext.
  static bool isUsable(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    if (uri == null || uri.scheme != 'https') {
      if (kDebugMode) debugPrint('AppImage: refusing non-https image URL (backend config issue)');
      return false;
    }
    return uri.host != 'localhost' && uri.host != '127.0.0.1';
  }

  @override
  Widget build(BuildContext context) {
    final placeholder = _Placeholder(iconSize: iconSize);
    final image = loadNetworkImages && isUsable(url)
        ? CachedNetworkImage(
            imageUrl: url!,
            fit: fit,
            fadeInDuration: MediaQuery.disableAnimationsOf(context)
                ? Duration.zero
                : const Duration(milliseconds: 180),
            placeholder: (_, _) => placeholder,
            errorWidget: (_, _, _) => placeholder,
          )
        : placeholder;
    return Semantics(
      image: true,
      label: semanticLabel,
      child: ExcludeSemantics(child: image),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.iconSize});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [c.ink800, Color.lerp(c.ink800, c.ember600, 0.18)!],
        ),
      ),
      child: Center(
        child: Icon(Icons.restaurant, size: iconSize, color: c.bronze400.withValues(alpha: 0.7)),
      ),
    );
  }
}
