import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi_satu/app/components/wg_alert_response.dart';

class CustomFunction {
  responseSuksesAction(String? message, Function action) {
    Get.dialog(
      barrierDismissible: false,
      WgAlertResponseButton(
        title: "Sukses",
        subtitle: message,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 50,
        ),
        buttontext: "Tutup",
        onPressed: action,
      ),
    );
  }
  responseFailed(String? failedMessage) {
    Get.dialog(
      barrierDismissible: false,
      WgAlertResponseButton(
        title: "Gagal",
        subtitle: failedMessage,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
        buttontext: "Tutup",
        onPressed: () {
          Get.back();
          // Get.back();
        },
      ),
    );
  }
}