import 'dart:convert';
import 'regreso.dart';
import 'package:http/http.dart' as HTTP;

class ObtieneDatos{
  static Future<String> getApi(String origen, String destino) async{
    String url = 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api/latest/currencies/';
    url += origen;
    url += '/';
    url += destino;
    url += '.json';

    final response = await HTTP.get(Uri.parse(url));

    print(url);
    print(response.body);

    return response.body.toString();
  }

  static Future<Regreso> getDatos(String origen, String destino) async{
    String miRegreso = '';
    miRegreso = await getApi(origen, destino);
    Map<String, dynamic> data = jsonDecode(miRegreso);

    return new Regreso(date: data['date'], mxn: data['mxn']);
  }
}