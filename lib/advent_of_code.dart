int calculateLineNumber({required String line}) {
  Map wordDigits = {
    "zero": "0",
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
  };

  RegExp exp =
      RegExp(r'(?:zero|one|two|three|four|five|six|seven|eight|nine|\d)');
  Iterable<Match> matches = exp.allMatches(line);

  String first = matches.first[0]!;
  String last = matches.last[0]!;

  if (first.length > 1 || last.length > 1) {
    line = line.replaceAllMapped(first, (m) => first + first[first.length - 1]);
    line = line.replaceAllMapped(last, (m) => last + last[last.length - 1]);
    matches = exp.allMatches(line);
    first = matches.first[0]!;
    last = matches.last[0]!;
  }

  if (first.length > 1) {
    first = wordDigits[first];
  }
  if (last.length > 1) {
    last = wordDigits[last];
  }

  return int.parse(first + last);
}
