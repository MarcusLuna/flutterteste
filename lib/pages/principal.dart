import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'clientelist.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();

  TextEditingController _searchQuery;
  bool _isSearching = false;
  Map data;
  List userData;
  List filter;

  Future getData() async {
    http.Response response =
        await http.get("http://192.168.6.30:8086/api/5/ClienteSAP");
    data = json.decode(response.body);
    setState(() {
      userData = data["extra"];
      filter = data["extra"];
    });
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
      filter.clear();
      filter.addAll(userData);
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQuery.clear();
      filter.clear();
      filter.addAll(userData);

    });
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }
    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: _startSearch,
      ),
    ];
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Pesquisar...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {
    if (newQuery != null) {
      filter = userData
          .where((i) => (i["cardName"].toString().contains(newQuery)
          ||
          i["cardCode"].toString().contains(newQuery)
      ))
          .toList();
    }

    if (newQuery.isEmpty) {
      filter.clear();
      filter.addAll(userData);
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchQuery = new TextEditingController();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: _isSearching
            ? new BackButton(
                color: Colors.white,
              )
            : null,
        title: _isSearching ? _buildSearchField() : Text('Clientes'),
        actions: _buildActions(),
      ),
      body: filter != null && filter.length > 0
          ? new ClienteList(filter)
          : userData == null
              ? new Center(child: new CircularProgressIndicator())
              : new Center(
                  child: new Text("Nenhum dado encontrado"),
                ),
    );
  }
}
