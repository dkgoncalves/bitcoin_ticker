import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'network.dart';
import 'crypto.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedPicker = currenciesList[0];
  String bitCoinRate;
  String ethRate;
  String ltcRate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Crypto(text: cryptoList[0], rate: bitCoinRate, selectedPicker: selectedPicker).cryptoCard(),
                Crypto(text: cryptoList[1], rate: ethRate, selectedPicker: selectedPicker).cryptoCard(),
                Crypto(text: cryptoList[2], rate: ltcRate, selectedPicker: selectedPicker).cryptoCard(),
              ],
            )
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              backgroundColor: Colors.lightBlue,
              onSelectedItemChanged: (selectedIndex) {
                setRates(selectedIndex: selectedIndex);
              },
              children: getPickerItems(),
            ),
          ),
        ],
      ),
    );
  }

  List<Text> getPickerItems() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }
    return items;
  }

  void setRates({int selectedIndex}) async {
    NetWork network = NetWork(currenciesList[selectedIndex]);
    await network.getRatesFromApi();

    setState(() {
      selectedPicker = currenciesList[selectedIndex];
      bitCoinRate = network.btcRate;
      ethRate = network.ethRate;
      ltcRate = network.ltcRate;
    });
  }

}
