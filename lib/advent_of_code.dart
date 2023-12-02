Game calculateGameCubes(String line) {
  int blue = 0;
  int green = 0;
  int red = 0;

  final ([game, cubes]) = line.split(':');
  final ([_, id]) = game.split(' ');
  print(id);

  final pulls = cubes.split(';');
  for (var pull in pulls) {
    final splitPull = pull.split(',');
    for (var cube in splitPull) {
      cube = cube.trim();
      final ([quantity, color]) = cube.split(' ');
      // print('$quantity $color');
      switch (color) {
        case 'blue':
          blue += int.parse(quantity);
          break;
        case 'green':
          green += int.parse(quantity);
          break;
        case 'red':
          red += int.parse(quantity);
          break;
      }
    }
  }
  print('$blue $green $red');
  return Game(id: id, blueSum: blue, greenSum: green, redSum: red);
}

class Game {
  final String id;
  final int blueSum;
  final int greenSum;
  final int redSum;

  const Game({
    required this.id,
    required this.blueSum,
    required this.greenSum,
    required this.redSum,
  });
}
