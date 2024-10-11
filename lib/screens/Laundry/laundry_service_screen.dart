import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaundryServiceScreen extends StatelessWidget {
  const LaundryServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = [
      'Kiloan Express (5 Jam)',
      'Kiloan Super Reguler (1 Hari)',
      'Kiloan Reguler (3 Hari)',
      'Paket Promo Laundry (48 Jam)',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Pilih Layanan Laundry',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...services.map((service) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(service),
              ),
            )).toList(),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Handle final confirmation
                // You can show a confirmation dialog or navigate to the next screen
                Get.dialog(
                  AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah anda yakin dengan pilihan layanan ini?'),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          // Navigate to the next screen or perform other actions
                          // For example: Get.toNamed(Routes.ORDER_SUMMARY);
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Konfirmasi'),
            ),
          ],
        ),
      ),
    );
  }
}