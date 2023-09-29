import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hangman_game/app/modules/home/utils/utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOLLY BOLLY'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // You can set the text color here
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Description: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Aamir khan movie in which he train his daughter for ',
                  ),
                  TextSpan(
                    text: 'wrestling',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 150,
                  child: Obx(
                    () => Image.asset(
                      controller.imageAsstes.value,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Obx(
                  () => Text(controller.guessWord.value),
                )
              ],
            ),

            // Keyboard
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              physics: const NeverScrollableScrollPhysics(),
              children: alphabets.map((charecter) {
                return Obx(
                  () => InkWell(
                    onTap: controller.usedCharacters.contains(charecter)
                        ? null
                        : () {
                            controller.charecterPress(charecter);
                            // controller.gessWord.value += charecter;
                          },
                    child: Center(child: Text(charecter)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
