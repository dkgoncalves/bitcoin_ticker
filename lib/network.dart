import 'package:http/http.dart' as http;
import 'dart:convert';

const kURL = 'https://rest.coinapi.io/v1/exchangerate';
const kApiKey = 'Your api key';
const kErrorMessage = 'Problem with the get request from api.';

class NetWork {
  String selectedRate;
  String btcRate;
  String ethRate;
  String ltcRate;

  NetWork(this.selectedRate);

  Future getRatesFromApi() async {
    await getBitCoinRate();
    await getEthRate();
    await getLtcRate();
  }

  Future getBitCoinRate() async {
    try {
      http.Response response = await http.get('$kURL/BTC/$selectedRate?$kApiKey');
      if (response.statusCode == 200) {
        double rate = jsonDecode(response.body)['rate'];
        btcRate = rate.toStringAsFixed(0);
      }
    }
    catch(e) {
      print(e);
      throw kErrorMessage;
    }
  }

  Future getEthRate() async {
    try {
      http.Response response = await http.get('$kURL/ETH/$selectedRate?$kApiKey');
      if (response.statusCode == 200) {
        double rate = jsonDecode(response.body)['rate'];
        ethRate = rate.toStringAsFixed(0);
      }
    }
    catch(e) {
      print(e);
      throw kErrorMessage;
    }
  }

  Future getLtcRate() async {
    try {
      http.Response response = await http.get('$kURL/LTC/$selectedRate?$kApiKey');
      if (response.statusCode == 200) {
        double rate = jsonDecode(response.body)['rate'];
        ltcRate = rate.toStringAsFixed(0);
      }
    }
    catch(e) {
      print(e);
      throw kErrorMessage;
    }
  }
}
