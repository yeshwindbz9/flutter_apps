import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:btc_val/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  PriceScreen({this.coinData});

  final coinData;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> menuItemList = [];
    for (String currency in currenciesList) {
      menuItemList.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: menuItemList,
      isExpanded: true,
      dropdownColor: Colors.black,
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItemList = [];
    for (String currency in currenciesList) {
      pickerItemList.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.black,
      children: pickerItemList,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
    );
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting? '⌛' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        title: Text(
            '💱 CryptoVal 💱',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/money.gif'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 2,
            ),
            makeCards(),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.black,
              child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    this.value,
    this.selectedCurrency,
    this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.black,
        elevation: 9.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
