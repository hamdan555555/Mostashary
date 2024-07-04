import 'package:get/get.dart';

class AddMoneyController extends GetxController {
  int Money = 0;
  int Cost = 0;
  addM() {
    Money = Money + 20000;
    update();
  }

  addC() {
    Cost = Cost + 1000;
    update();
  }
}
