import 'dart:async';
import 'package:http/http.dart as http';
import 'package:flutter/material.dart';
import 'package:news/Model/model.dart';

String API_KEY = '91293dc575ab4008afada0978d321ca1';
Future<List<Source>> fetchNewsSource() async{
  final response = await http.get('http://newsapi.org/v2/sources?apiKey=${API_KEY}');

  if(response.statusCode == 200) //HTTP OK
    {
      List sources = json.decode(response.body)['sources'];
      return sources.map((source) => new Source.fromJson(source)).toList();
    }
  else
    {
      throw Exception ('Failed to load News');
    }
}

void main() => runApp(new SourceScreen());

class SourceScreen extends StatefulWidget {
  @override
  _SourceScreenState createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {

 var list_sources;
 var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState (){
   super.initState();
   refreshListSource();
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title:'NEWS FOR ABA',
    theme: ThemeData(primarySwatch: colors.blue),
    home: Scaffold(
      appBar: AppBar(title: Text('NEWS FOR ABA'),),
      body: Center(),
    )
  );
}

Future<Null> refreshListSource(){
  refreshKey.currentState?.show(atTop: false);

  setState((){
    var list_sources = fetchNewSource ();
    );}

void setState(Null Function() param0) {
}

fetchNewSource() {
};

  return null;

}

