import 'package:get/get.dart';
import 'package:hangman_game/app/routes/app_pages.dart';

class StartController extends GetxController {
  startGame() {
    print("object");
    Get.toNamed(Routes.HOME);
  }
}
