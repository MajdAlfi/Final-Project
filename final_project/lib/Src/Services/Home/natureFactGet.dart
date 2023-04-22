import 'dart:convert';

import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

natureFactGet(context) async {
  String baseUrl = 'http://localhost:4000/api/naturefacts';
  final url = Uri.parse(baseUrl);
  List factList = [];
  final data =
      await http.get(url, headers: {'Content-Type': "application/json"});
  if (data.statusCode == 200) {
    factList.addAll(json.decode(data.body));
//    print(data.body);
    Provider.of<dataprovider>(context, listen: false)
        .changeNatureFact(factList);
  }
}
