import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';


final randomizer = Random();

class RollDice extends StatefulWidget {
  const RollDice({super.key});
  
  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  var diceImg = "img/dice-1.png" ;

  // void rollDice() {
  //   var no = randomizer.nextInt(6)+1;

  //   setState(() {
  //    for (var i = 0; i < 100; i++) {
  //     for (var j = 1; j < 7; j++) {
  //      diceImg = 'img/dice-$i.png';
       
  //     }
  //    } 
  //   diceImg = 'img/dice-$no.png';
  //   });
  // }
// ...

void rollDice() {
  var no = randomizer.nextInt(6) + 1;

  const int totalFrames = 15;
  const int frameDuration = 30; // milliseconds

  int currentFrame = 0;
  Timer.periodic(const Duration(milliseconds: frameDuration), (timer) {
    setState(() {
      if (currentFrame < totalFrames) {
        diceImg = 'img/dice-${randomizer.nextInt(6) + 1}.png';
        currentFrame++;
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 150), () {
          setState(() {
            diceImg = 'img/dice-$no.png'; // Set the final dice image
          });
        });
      }
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              diceImg,
              width: 150,
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 93, 214),
                    Color.fromARGB(255, 252, 14, 145)
                  ],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: const Color.fromARGB(255, 106, 26, 81),
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              height: 60,
              width: 150,
              child: TextButton(
                onPressed: rollDice,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Roll Dice"),
              ),
            )
          ],
        );
  }
}