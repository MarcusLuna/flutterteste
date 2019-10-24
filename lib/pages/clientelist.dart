import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'detalhes.dart';
import 'principal.dart';

class ClienteList extends StatelessWidget {
  List filter;

  ClienteList(this.filter);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: filter == null ? 0 : filter.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("${filter[index]["cardName"]} ",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text("${filter[index]["cardCode"]} "),
                leading: CircleAvatar(
                  child: Text(
                    "${filter[index]["cardName"][0]}",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
              ),
            )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(filter[index])));
            },
          );
        });
  }
}
