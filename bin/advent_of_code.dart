import 'dart:io';

import 'package:advent_of_code/advent_of_code.dart';

void main(List<String> arguments) {
  final file = File('bin/input.txt');
  List<String> lines = file.readAsLinesSync();

  int sumOfParts = calculate(lines);
  print('The sum of the machine parts is: $sumOfParts');
}
