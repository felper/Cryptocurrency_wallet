import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../component.dart';

class DetailWalletScreen extends StatefulWidget {
  const DetailWalletScreen({super.key});

  @override
  State<DetailWalletScreen> createState() => _DetailWalletScreenState();
}

class _DetailWalletScreenState extends State<DetailWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
            left: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
            title: 'Bitcoin Wallet',
            right: Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            _cardWallet(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Day'),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text('Week')),
                  Text('Month'),
                  Text('Year'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            card(
                padding: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _dot(color: Colors.pink),
                              Text('Lower: \$4.696',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45)),
                            ],
                          ),
                          Row(
                            children: [
                              _dot(color: Colors.green),
                              Text('Higher: \$6.696',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          8, //aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
                      child: Stack(
                        children: [
                          LineChart(
                            sampleData(),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Row(
                              children: [
                                _dot(color: Colors.orangeAccent, size: 18),
                                Text(
                                  '1BBTC=\$5.483',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: _actionButton(
                    text: 'Buy',
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: _actionButton(
                    text: 'Sell',
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
          bottomTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(showTitles: false)),
      borderData: FlBorderData(show: false),
      maxX: 14,
      maxY: 3,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
          spots: [
            FlSpot(1, 2),
            FlSpot(3, 2.8),
            FlSpot(7, 2.2),
            FlSpot(10, 2.8),
            FlSpot(12, 2.6),
            FlSpot(13, 3),
          ],
          isCurved: true,
          colors: const [Colors.orangeAccent],
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
              show: true, colors: [Color.fromARGB(255, 248, 210, 161)])),
    ];
  }

  _dot({Color color = Colors.black, double size = 10}) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  _actionButton({Color color = Colors.green, required String text}) {
    return card(
        child: Column(children: [
      ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: Colors.black,
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                Icons.attach_money,
                color: Colors.white,
                size: 25,
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(
        '$text',
        style: TextStyle(fontSize: 24, color: Colors.black54),
      )
    ]));
  }

  _cardWallet() {
    return card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Bitcoin-icon.png',
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text('Bitcoin',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text('BTC'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '42.33324 BTC',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black87),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$76.9898',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black38),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Text(
                  '+7.77%',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Center(
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
