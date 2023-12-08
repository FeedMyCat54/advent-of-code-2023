int calculate(List<String> lines) {
  int total = 0;
  final Map<String, (String, String)> nodes = {};
  final instructions = lines.first.trim().split('');

  for (var line in lines.getRange(2, lines.length - 1)) {
    var splitLine = line.split('=');
    var node = splitLine.first.trim();
    var connections = splitLine.last
        .trim()
        .substring(1, splitLine.last.length - 2)
        .split(',');
    nodes[node] = (connections.first.trim(), connections.last.trim());
  }

  final start = nodes['AAA'];
  final end = nodes['ZZZ'];

  if (start == null || end == null) {
    return -1;
  }

  return walkToEnd('AAA', 'ZZZ', instructions, nodes).length;
}

List<String> walkToEnd(
  String start,
  String end,
  List<String> directions,
  Map<String, (String, String)> nodes,
) {
  final List<String> steps = [];
  String current = start;

  while (current != end) {
    for (var dir in directions) {
      if (dir == 'R') {
        current = nodes[current]!.$2;
        steps.add(current);
      } else if (dir == 'L') {
        current = nodes[current]!.$1;
        steps.add(current);
      }

      if (current == end) {
        break;
      }
    }
  }

  return steps;
}
