import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/database.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/screens/multiqr.dart';

import 'confirmDelete.dart';

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  List<bool> _selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Stored Data",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 65, 192, 69),
          ),
        ),
        body: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Text(
                    "Could not get data :(\n" + snapshot.error.toString());
              } else if (snapshot.hasData) {
                List<Performance> allData = snapshot.data;

                // No data to be displayed
                if (allData.length == 0) {
                  return Center(
                    child: Text("Nothing is stored!",
                        style: TextStyle(fontSize: 24)),
                  );
                }

                if (_selected.length != allData.length) {
                  _selected = List.generate(allData.length, (index) => false);
                }

                List<DataRow> rows = [];

                for (int i = 0; i < allData.length; i++) {
                  rows.add(createMatchRow(allData[i], i));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${_selected.where((value) => value).length} Selected"),
                          Row(children: [
                            IconButton(
                                onPressed: () {
                                  String csv = "";

                                  for (int i = 0; i < _selected.length; i++) {
                                    if (_selected[i]) {
                                      csv += allData[i].toString() + "\n";
                                    }
                                  }

                                  if (csv.isEmpty) {}
                                  ;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MultiQrCode(data: csv)),
                                  );
                                },
                                icon: Icon(Icons.qr_code_2)),
                            IconButton(
                                onPressed: () {
                                  List<int> indexes = [];

                                  for (int i = 0; i < _selected.length; i++) {
                                    if (_selected[i]) {
                                      setState(() {
                                        indexes.add(i);
                                      });
                                    }
                                  }

                                  List<List<String>> delete_items = [];
                                  for (int i = 0; i < allData.length; i++) {
                                    if (_selected[i]) {
                                      delete_items.add([
                                        allData[i].match.toString(),
                                        allData[i].team.toString()
                                      ]);
                                    }
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConfirmDelete(delete_items)),
                                  );
                                  ;
                                },
                                icon: Icon(Icons.delete_forever)),
                          ])
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(0.0),
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text("Match")),
                            DataColumn(label: Text("Team")),
                          ],
                          rows: rows,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Text("Loading data...");
            },
            future: performance()));
  }

  DataRow createMatchRow(Performance data, int index) {
    return DataRow(
        cells: [
          DataCell(
            Text(
              data.match.toString(),
            ),
          ),
          DataCell(
            Text(data.team.toString()),
          )
        ],
        selected: _selected[index],
        onSelectChanged: (bool? value) {
          setState(() {
            _selected[index] = value!;
          });
        });
  }
}
