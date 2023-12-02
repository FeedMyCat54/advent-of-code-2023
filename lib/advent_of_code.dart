Game calculateGameCubes(String line) {
  int blue = 0;
  int green = 0;
  int red = 0;

  final ([game, cubes]) = line.split(':');
  final ([_, id]) = game.split(' ');

  final pulls = cubes.split(';');
  for (var pull in pulls) {
    final splitPull = pull.split(',');
    for (var cube in splitPull) {
      cube = cube.trim();
      final ([quantity, color]) = cube.split(' ');
      switch (color) {
        case 'blue':
          if (int.parse(quantity) > blue) {
            blue = int.parse(quantity);
          }
          break;
        case 'green':
          if (int.parse(quantity) > green) {
            green = int.parse(quantity);
          }
          break;
        case 'red':
          if (int.parse(quantity) > red) {
            red = int.parse(quantity);
          }
          break;
      }
    }
  }
  return Game(id: id, blues: blue, greens: green, reds: red);
}

class Game {
  final String id;
  final int blues;
  final int greens;
  final int reds;

  const Game({
    required this.id,
    required this.blues,
    required this.greens,
    required this.reds,
  });
}
