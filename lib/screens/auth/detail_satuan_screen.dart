// File: lib/auth/detail_satuan_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/laundry_satuan_controller.dart';

class DetailSatuanScreen extends StatelessWidget {
  final controller = Get.put(LaundrySatuanController());

  @override
  Widget build(BuildContext context) {
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
          'Detail Item Satuan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildItemList(),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          onChanged: controller.filterItems,
          decoration: InputDecoration(
            hintText: 'Masukkan Nama Item',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.list),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildItemList() {
    return Obx(() => ListView.builder(
      itemCount: controller.filteredItems.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final item = controller.filteredItems[index];
        return _buildItemCard(item);
      },
    ));
  }

  Widget _buildItemCard(LaundryItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Rp ${item.price}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Obx(() => ElevatedButton(
              onPressed: () => controller.toggleItem(item),
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.isItemSelected(item)
                    ? Colors.grey
                    : Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(
                controller.isItemSelected(item) ? 'Ditambahkan' : 'Tambahkan',
                style: const TextStyle(color: Colors.white),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Budi Doremi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total: ${controller.selectedItems.length} Satuan',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.lanjutPembayaran(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B795E),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Layanan Satuan'),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => controller.clearItems(),
            icon: const Icon(Icons.delete_outline),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
