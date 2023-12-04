import 'dart:collection';
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

int calculatePart2(List<String> input) {
  final List<int> winsPerCard = [];
  final Map<int, int> cardCopies = {};

  for (var (index, line) in input.indexed) {
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
    winsPerCard.add(winningNumbers);
    cardCopies[index] = 1;
  }

  for (var (i, num) in winsPerCard.indexed) {
    int numOfCopies = cardCopies[i] ?? 1;
    for (var j = 1; j <= num; j++) {
      int nextCard = cardCopies[i + j] ?? 1;
      cardCopies[i + j] = nextCard + numOfCopies;
    }
  }

  return cardCopies.values.reduce((value, element) => value + element);
}
