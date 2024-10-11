// File: lib/auth/controllers/laundry_satuan_controller.dart

import 'package:get/get.dart';

class LaundrySatuanController extends GetxController {
  final allItems = <LaundryItem>[
    LaundryItem('Kemeja', 5000),
    LaundryItem('Celana Bahan', 7000),
    LaundryItem('Jaket', 10000),
    LaundryItem('Kaos', 5000),
    LaundryItem('CD/BRA', 5000),
    LaundryItem('Jas', 25000),
    LaundryItem('Selimut', 15000),
  ].obs;

  final selectedItems = <LaundryItem>[].obs;
  final filteredItems = <LaundryItem>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    filteredItems.assignAll(allItems);
    super.onInit();
  }

  void filterItems(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredItems.assignAll(allItems);
    } else {
      filteredItems.assignAll(allItems.where(
            (item) => item.name.toLowerCase().contains(query.toLowerCase()),
      ));
    }
  }

  bool isItemSelected(LaundryItem item) {
    return selectedItems.contains(item);
  }

  void toggleItem(LaundryItem item) {
    if (isItemSelected(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  void clearItems() {
    selectedItems.clear();
  }

  void lanjutPembayaran() {
    if (selectedItems.isEmpty) {
      Get.snackbar(
        'Error',
        'Pilih minimal satu item',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    // Implementasi lanjut ke pembayaran
    //Get.toNamed(Routes.PILIH_PEWANGI);
  }
}

class LaundryItem {
  final String name;
  final int price;

  LaundryItem(this.name, this.price);
}
