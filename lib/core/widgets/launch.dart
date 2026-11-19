import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the dialler. Shows a snackbar if the device can't place calls.
Future<void> callNumber(BuildContext context, String phone) async {
  final uri = Uri(scheme: 'tel', path: phone);
  final messenger = ScaffoldMessenger.of(context);
  if (!await launchUrl(uri)) {
    messenger.showSnackBar(SnackBar(content: Text('Couldn’t open the dialler. Please call $phone.')));
  }
}

/// Opens Google Maps (app or web) at coordinates, or searches the address.
Future<void> openMap(BuildContext context, {double? lat, double? lng, required String label}) async {
  final query = lat != null && lng != null ? '$lat,$lng' : label;
  final uri = Uri.https('www.google.com', '/maps/search/', {'api': '1', 'query': query});
  final messenger = ScaffoldMessenger.of(context);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    messenger.showSnackBar(const SnackBar(content: Text('Couldn’t open maps on this device.')));
  }
}
