import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  AlignmentGeometry iconAlignment = Alignment.topLeft;
  int count = 0;

  @override
  void initState() {
    super.initState();

    generateAnswerOne();
    generateAnswerThree();
    generateAnswerFour();
    animateItAnswerTwo();
  }

  animateItAnswerTwo() async {
    await Future.delayed(const Duration(seconds: 1));

    switch (count) {
      case 0:
        iconAlignment = Alignment.topLeft;
        break;
      case 1:
        iconAlignment = Alignment.topRight;
        break;
      case 2:
        iconAlignment = Alignment.bottomRight;
        break;
      case 3:
        iconAlignment = Alignment.bottomLeft;
        break;
    }

    count++;
    if (count > 3) {
      count = 0;
    }

    setState(() {});
    animateItAnswerTwo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedAlign(
          duration: const Duration(seconds: 1),
          alignment: iconAlignment,
          child: const Icon(
            Icons.ac_unit,
            size: 40,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  void generateAnswerOne() {
    String example = "my name is Kashif";

    String sentence =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

    debugPrint(example.split(' ').reversed.join(' '));

    debugPrint(sentence.split(' ').reversed.join(' '));
  }

  void generateAnswerThree() {
    final diagonal = [
      [1, 3, 9, 4],
      [4, 5, 4, 2],
      [4, 5],
      [1, 3, 9, 7]
    ];

    int sum = 0;
    int maxNumber = 0;

    for (int i = 0; i < diagonal.length; i++) {
      for (int j = 0; j < diagonal[i].length; j++) {
        if (j <= i) {
          sum += diagonal[i][j];

          if (diagonal[i][j] > maxNumber) {
            maxNumber = diagonal[i][j];
          }
        }
      }
    }

    debugPrint('sum => $sum');

    debugPrint('max Number => $maxNumber');
  }

  void generateAnswerFour() {
    const str = "1,0,9,20.12,23.0,5,9.1,2,0,8";

    final myList = str.split(',');

    List<int> myIntList = [];

    num sumOfAll = 0;
    num sumOfEven = 0;

    for (int i = 0; i < myList.length; i++) {
      sumOfAll += num.parse(myList[i]);
      myIntList.add(double.parse(myList[i]).toInt());
      if (myIntList[i] % 2 == 0) {
        sumOfEven += myIntList[i];
      }
    }
    debugPrint('sum Of All => $sumOfAll');
    myIntList.sort();
    debugPrint('Sorted Array => $myIntList');
    debugPrint('sum of Even => $sumOfEven');
    debugPrint('Unique Integers => ${myIntList.toSet().toList()}');
  }
}
