import 'package:get/get.dart';

class RepairsController extends GetxController {
  var selectedPage = 0.obs;
  updateSelectedPage(index) {
    selectedPage.value = index;
  }
}
