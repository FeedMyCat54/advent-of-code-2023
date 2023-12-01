int calculateLineNumber({required String line}) {
  RegExp exp = RegExp(r'\d');
  Iterable<Match> matches = exp.allMatches(line);

  String first = matches.first[0]!;
  String last = matches.last[0]!;

  return int.parse(first + last);
}
