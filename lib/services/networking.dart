import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{
  NetworkHelper( {required this.url,});
  final String url;
  //final String cityUrl;

  Future getData() async{
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return(jsonDecode(response.body));
    }else{
      return(response.statusCode);
    }
  }
  //
  // Future<String> getCity() async{
  //   http.Response response = await http.get(Uri.parse(cityUrl));
  //   if(response.statusCode==200){
  //     return(jsonDecode(response.body)[0]['name']);
  //   }else{
  //     return('{city}');
  //   }
  // }
}