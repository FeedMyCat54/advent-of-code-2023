import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:developer';

import 'package:advent_of_code/advent_of_code.dart';

void main(List<String> arguments) async {
  const redMax = 12;
  const greenMax = 13;
  const blueMax = 14;
  int sum = 0;

  final file = File('bin/input.txt');
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.

  List<Game> gameSums = [];
  try {
    await for (var line in lines) {
      gameSums.add(calculateGameCubes(line));
    }
  } catch (e) {
    print('Error: $e');
  }

  for (var result in gameSums) {
    inspect(result);
    if (result.blueSum <= blueMax &&
        result.redSum <= redMax &&
        result.greenSum <= greenMax) {
      sum += int.parse(result.id);
    }
  }

  print('The sum of the valid ids is: $sum');
}
