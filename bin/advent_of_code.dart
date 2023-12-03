import 'dart:io';

import 'package:advent_of_code/advent_of_code.dart';

void main(List<String> arguments) {
  final file = File('bin/input.txt');
  List<String> lines = file.readAsLinesSync();

  final (int sumOfParts, int sumOfGearRatios) = calculate(lines);
  print('The sum of the machine parts is: $sumOfParts');
  print('The sum of the gear ratios in the machine is: $sumOfGearRatios');
}
