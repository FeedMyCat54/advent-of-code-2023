import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:advent_of_code/advent_of_code.dart' as advent_of_code;

void main(List<String> arguments) async {
  final file = File('bin\\input.txt');
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.

  int sum = 0;

  try {
    await for (var line in lines) {
      sum += advent_of_code.calculateLineNumber(line: line);
    }
    print('The value is: $sum');
  } catch (e) {
    print('Error: $e');
  }
}
