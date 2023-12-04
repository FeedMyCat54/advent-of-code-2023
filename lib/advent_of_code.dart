import 'dart:math';

int calculate(List<String> input) {
  int sum = 0;

  for (var line in input) {
    final card = line.split('|');
    final luckyNumbers = card.first
        .split(':')
        .last
        .trim()
        .split(' ')
        .where((element) => element != '')
        .map((e) => int.parse(e))
        .toList();
    final cardNumbers = card.last
        .trim()
        .split(' ')
        .where((element) => element != '')
        .map((e) => int.parse(e))
        .toList();

    final winningNumbers = cardNumbers.fold(
        0,
        (previousValue, element) =>
            luckyNumbers.contains(element) ? previousValue + 1 : previousValue);
    sum += winningNumbers != 0 ? pow(2, winningNumbers - 1).toInt() : 0;
  }

  return sum;
}
