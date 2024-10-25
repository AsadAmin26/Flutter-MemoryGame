class Game {
  final String unknownCardPath = 'assets/images/question.png';
  List<String>? gameImg;
  final int cardCount = 8;

  List<String> cardList = [
    "assets/images/apple.png",
    "assets/images/banana.png",
    "assets/images/orange.png",
    "assets/images/watermelon.png",
    "assets/images/banana.png",
    "assets/images/watermelon.png",
    "assets/images/orange.png",
    "assets/images/apple.png",
  ];
  List<Map<int, String>> matchCheck = [];

  void initGame() {
    cardList.shuffle();
    gameImg = List.generate(cardCount, (index) => unknownCardPath);
  }
}
