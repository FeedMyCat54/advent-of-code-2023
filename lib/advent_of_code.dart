int calculate(List<String> input) {
  List<int> times = getValues(input[0]);
  List<int> records = getValues(input[1]);
  List<int> waysToWin = [];

  for (var i = 0; i < times.length; i++) {
    int count = 0;
    for (var j = 1; j < times[i]; j++) {
      var n = calculateDistance(j, times[i] - j);
      if (n > records[i]) {
        count++;
      }
    }
    waysToWin.add(count);
  }

  return waysToWin.fold(1, (previousValue, element) => previousValue * element);
}

int calculatePart2(List<String> input) {
  int time = getValuesPart2(input[0]);
  int record = getValuesPart2(input[1]);
  int start = 0, end = 0;

  for (var i = 0; i < time; i++) {
    if (calculateDistance(i, time - i) > record) {
      start = i;
      break;
    }
  }

  for (var i = time; i > 0; i--) {
    if (calculateDistance(i, time - i) > record) {
      end = i;
      break;
    }
  }
  return start < end ? end - start + 1 : 0;
}

int calculateDistance(int timePressed, int timeLeft) {
  return timePressed * timeLeft;
}

List<int> getValues(String line) {
  return line
      .split(':')
      .last
      .split(' ')
      .where((element) => element != '')
      .map((e) => int.parse(e.trim()))
      .toList();
}

int getValuesPart2(String line) {
  return int.parse(line
      .split(':')
      .last
      .split(' ')
      .where((element) => element != '')
      .join(''));
}
