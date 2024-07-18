import 'package:flutter_tirtakencana_tatawarna/models/total_hadiah.dart';
import 'package:flutter_tirtakencana_tatawarna/services/hadiah_service.dart';
import 'package:get/get.dart';

class HadiahController extends GetxController {
  var hadiahList = <Summary>[].obs;
  var totalHadiah = 0.obs;
  var selectedValue = 'Pilih Alasan'.obs;

  @override
  void onInit() {
    fetchHadiah();
    super.onInit();
  }

  Future<void> fetchHadiah() async {
    try {
      var result = await HadiahService.fetchTotalHadiah();
      hadiahList.assignAll(result.data.summary);
      totalHadiah.value = result.data.totalHadiah;
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
