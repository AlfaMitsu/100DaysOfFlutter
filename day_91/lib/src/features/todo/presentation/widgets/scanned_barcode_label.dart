import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../constants/colors.dart';

class ScannedBarcodeLabel extends StatelessWidget {
  final Stream<BarcodeCapture> barcodes;
  const ScannedBarcodeLabel({super.key, required this.barcodes});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: barcodes,
      builder: (context, snapshot) {
        final scannedBarcodes = snapshot.data?.barcodes ?? [];

        if (scannedBarcodes.isEmpty) {
          return const Text(
            'Scan something!',
            overflow: TextOverflow.fade,
            style: TextStyle(color: kWhiteColor),
          );
        }

        return Text(
          scannedBarcodes.first.displayValue ?? 'No display value.',
          overflow: TextOverflow.fade,
          style: const TextStyle(color: kWhiteColor),
        );
      },
    );
  }
}
