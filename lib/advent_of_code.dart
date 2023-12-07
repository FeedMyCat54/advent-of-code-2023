int calculate(List<String> input) {
  int total = 0;
  final Map<HandType, List<HandWithBid>> handsPerType = {
    for (var element in HandType.values) element: []
  };

  for (var line in input) {
    final x = line.split(' ');
    final handWithBid =
        HandWithBid(hand: stringToCardList(x.first), bid: int.parse(x.last));

    handsPerType[evaluateHand(handWithBid.hand)]!.add(handWithBid);
  }

  for (var element in handsPerType.entries) {
    element.value.sort((a, b) => compareHands(a.hand, b.hand));
  }

  for (var (i, element)
      in handsPerType.values.expand((element) => element).indexed) {
    int bids = element.bid * (i + 1);
    total += bids;
  }

  return total;
}

enum HandType { high, one, two, three, full, four, five }

enum Card {
  joker,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  queen,
  king,
  ace
}

extension Comparison on Card {
  bool isGreaterThan(Card other) {
    return index > other.index;
  }

  bool isEqualTo(Card other) {
    return index == other.index;
  }
}

int compareHands(List<Card> hand1, List<Card> hand2) {
  for (final (index, card) in hand1.indexed) {
    if (card.isEqualTo(hand2[index])) {
      continue;
    } else if (card.isGreaterThan(hand2[index])) {
      return 1;
    } else {
      return -1;
    }
  }

  return 1;
}

HandType evaluateHand(List<Card> hand) {
  final Map<Card, int> cards = {};
  int jokers = 0;

  for (var card in hand) {
    if (card == Card.joker) {
      jokers++;
      continue;
    }
    var count = cards[card];
    cards[card] = count == null ? 1 : count + 1;
  }

  // Replace the jokers
  if (jokers > 0) {
    int mostCopies = cards.values.fold(
        1,
        (previousValue, element) =>
            element > previousValue ? element : previousValue);
    List<Card> cardsWithMostCopies = cards.entries
        .where((element) => element.value == mostCopies)
        .map((e) => e.key)
        .toList();
    cardsWithMostCopies.sort((a, b) => a.isGreaterThan(b) ? -1 : 1);

    if (cardsWithMostCopies.isEmpty) {
      cards[Card.joker] = 5;
    } else {
      cards[cardsWithMostCopies[0]] = cards[cardsWithMostCopies[0]]! + jokers;
    }
  }

  int prod = cards.values.reduce((value, element) => value * element);

  HandType type;
  switch (prod) {
    case 1:
      type = HandType.high;
      break;
    case 2:
      type = HandType.one;
      break;
    case 3:
      type = HandType.three;
      break;
    case 4:
      type = cards.values.length == 2 ? HandType.four : HandType.two;
      break;
    case 5:
      type = HandType.five;
      break;
    case 6:
      type = HandType.full;
      break;
    default:
      type = HandType.high;
  }

  return type;
}

List<Card> stringToCardList(String hand) {
  List<Card> cardList = [];
  for (var card in hand.split('')) {
    switch (card) {
      case 'A':
        cardList.add(Card.ace);
        break;
      case 'K':
        cardList.add(Card.king);
        break;
      case 'Q':
        cardList.add(Card.queen);
        break;
      case 'J':
        cardList.add(Card.joker);
        break;
      case 'T':
        cardList.add(Card.ten);
        break;
      case '9':
        cardList.add(Card.nine);
        break;
      case '8':
        cardList.add(Card.eight);
        break;
      case '7':
        cardList.add(Card.seven);
        break;
      case '6':
        cardList.add(Card.six);
        break;
      case '5':
        cardList.add(Card.five);
        break;
      case '4':
        cardList.add(Card.four);
        break;
      case '3':
        cardList.add(Card.three);
        break;
      case '2':
        cardList.add(Card.two);
        break;
      default:
        cardList.add(Card.two);
    }
  }
  return cardList;
}

class HandWithBid {
  final List<Card> hand;
  final int bid;

  HandWithBid({required this.hand, required this.bid});
}
