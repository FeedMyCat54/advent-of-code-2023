import 'dart:io';

import 'package:advent_of_code/advent_of_code.dart';

void main(List<String> arguments) {
  const redMax = 12;
  const greenMax = 13;
  const blueMax = 14;
  int sum = 0;
  int power = 0;

  final file = File('bin/input.txt');
  List<String> lines = file.readAsLinesSync();

  try {
    for (var line in lines) {
      Game result = calculateGameCubes(line);
      if (result.blues <= blueMax &&
          result.reds <= redMax &&
          result.greens <= greenMax) {
        sum += int.parse(result.id);
      }

      power += result.blues * result.reds * result.greens;
    }
  } catch (e) {
    print('Error: $e');
  }
  print('The sum of the valid ids is: $sum');
  print('The sum of the powers is: $power');
}
