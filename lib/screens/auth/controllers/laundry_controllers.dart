import 'package:get/get.dart';

class LaundryController extends GetxController {
  final selectedLayanan = ''.obs;
  final selectedPewangi = ''.obs;
  final beratLaundry = 0.0.obs;
  final totalHarga = 0.obs;

  void setLayanan(String layanan) {
    selectedLayanan.value = layanan;
  }

  void setPewangi(String pewangi) {
    selectedPewangi.value = pewangi;
  }

  void setBerat(double berat) {
    beratLaundry.value = berat;
    hitungTotal();
  }

  void hitungTotal() {
    double hargaPerKg = 0;
    switch (selectedLayanan.value) {
      case 'Kiloan Express (5 Jam)':
        hargaPerKg = 15000;
        break;
      case 'Kiloan Super Reguler (1 Hari)':
        hargaPerKg = 10000;
        break;
    // ... dan seterusnya
    }
    totalHarga.value = (hargaPerKg * beratLaundry.value).round();
  }

  void resetData() {
    selectedLayanan.value = '';
    selectedPewangi.value = '';
    beratLaundry.value = 0;
    totalHarga.value = 0;
  }
}
