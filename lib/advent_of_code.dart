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
        print(count);
      }
    }
    waysToWin.add(count);
  }

  return waysToWin.fold(1, (previousValue, element) => previousValue * element);
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
