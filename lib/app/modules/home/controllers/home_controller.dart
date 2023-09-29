import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hangman_game/app/routes/app_pages.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    imageAsstes.value = "assets/images/6.png";
    super.onInit();
  }

  String solution = "dangal".toUpperCase();

  RxString guessWord = "______".obs;
  RxString imageAsstes = "".obs;
  RxList usedCharacters = [].obs;
  RxInt lives = 5.obs;

  charecterPress(String letter) {
    usedCharacters.add(letter);

    bool found = false;
    for (int i = 0; i < solution.length; i++) {
      if (solution[i] == letter) {
        guessWord.value = guessWord.value.replaceRange(i, i + 1, letter);
        found = true;
      }
    }

    if (!found && lives.value > 1) {
      lives.value--;
      imageAsstes.value = "assets/images/${lives.value}.png";
      print(lives.value);
      print(imageAsstes.value);
    } else if (lives.value == 1) {
      print("GAME LOST");
      showResultDialog("GAME LOST");
    } else if (!guessWord.value.contains('_')) {
      print("GAME WON");
      showResultDialog("GAME WON");
    }
  }

  showResultDialog(String result) {
    Get.defaultDialog(
      title: "Result",
      content: Center(
        child: Text(result),
      ),
    );
  }
}
