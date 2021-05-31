import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'TRX',
  'DOT',
];

const apiKey = 'E618108B-CFF7-4664-90E4-FC7B45FAD685';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  
  Future getCoinData(String selectedCurrency) async{
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList){
      String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        dynamic price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with GET request';
      }
    }
    return cryptoPrices;
  }

}
