import 'dart:io';

import 'package:advent_of_code/advent_of_code.dart';

void main(List<String> arguments) {
  final file = File('bin/input.txt');
  List<String> lines = file.readAsLinesSync();
  print('Steps needed to escape: ${calculate(lines)}!');
}
