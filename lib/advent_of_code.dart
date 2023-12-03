int calculate(List<String> input) {
  int sum = 0;

  List<List<String>> inputList = input.map((e) => e.split('')).toList();

  for (var (lineIndex, line) in inputList.indexed) {
    for (final (charIndex, char) in line.indexed) {
      if (char != '.' && int.tryParse(char) == null) {
        sum += findNumbersAroundSymbol(inputList, lineIndex, charIndex);
      }
    }
  }

  return sum;
}

int findNumbersAroundSymbol(List<List<String>> input, int row, int column) {
  int sum = 0;

  for (var i = row - 1; i <= row + 1; i++) {
    for (var j = column - 1; j <= column + 1; j++) {
      if (i >= 0 && i < input.length && j >= 0 && j < input[0].length) {
        if (int.tryParse(input[i][j]) != null) {
          sum += int.parse(takeWholeNumber(input[i], j));
        }
      }
    }
  }

  return sum;
}

String takeWholeNumber(List<String> line, int position) {
  return takeLeftNumber(line, position - 1) +
      line[position] +
      takeRightNumber(line, position + 1);
}

String takeLeftNumber(List<String> line, int position) {
  String num = "";
  if (position < 0 || int.tryParse(line[position]) == null) {
    return num;
  }

  num = takeLeftNumber(line, position - 1);
  String cur = line[position];
  line[position] = '.';

  return num + cur;
}

String takeRightNumber(List<String> line, int position) {
  String num = "";
  if (position == line.length || int.tryParse(line[position]) == null) {
    return num;
  }

  num = takeRightNumber(line, position + 1);
  String cur = line[position];
  line[position] = '.';

  return cur + num;
}
