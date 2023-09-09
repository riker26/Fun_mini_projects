import 'package:flutter/material.dart';

void main() => runApp(PokerApp());

class PokerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Texas Hold \'em',
      theme: ThemeData(primarySwatch: Colors.green),
      home: PokerTable(),
    );
  }
}

class PokerTable extends StatefulWidget {
  @override
  _PokerTableState createState() => _PokerTableState();
}

class _PokerTableState extends State<PokerTable> {
  // For demonstration, some sample cards. Replace with actual logic.
  List<String> communityCards = ['AS', 'KH', '7D', 'JC', '2H'];
  List<String> playerCards = ['10H', '9H'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Texas Hold \'em')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Community Cards:'),
            CardRow(cards: communityCards),
            SizedBox(height: 50),
            Text('Your Cards:'),
            CardRow(cards: playerCards),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: Text('Fold')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () {}, child: Text('Call')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () {}, child: Text('Raise')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  final List<String> cards;

  CardRow({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cards.map((card) => CardWidget(card: card)).toList(),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String card;

  CardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(card),
    );
  }
}
