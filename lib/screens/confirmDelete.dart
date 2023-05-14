import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/database.dart';

class ConfirmDelete extends StatefulWidget {
  List<List<String>> indexes;
  ConfirmDelete(this.indexes);

  @override
  State<StatefulWidget> createState() => _ConfirmDeleteState(indexes);
}

class _ConfirmDeleteState extends State<ConfirmDelete> {
  List<List<String>> indexes;
  _ConfirmDeleteState(this.indexes);

  bool longPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Are you sure?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 255, 0, 0),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "WARNING: You are about to delete ${indexes.length} item${indexes.length == 1 ? "" : "s"}!\n\nYou should NEVER delete actual match data during a competition!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (longPressed) {
                            for (List<String> info in indexes) {
                              deletePerformance(info[0], info[1]);
                            }
                            Navigator.pop(context);
                          }
                        },
                        onLongPress: () {
                          setState(() {
                            longPressed = true;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: Text(
                          "Yes, delete ${indexes.length} item${indexes.length == 1 ? "" : "s"}\n(${longPressed ? "Press again to confirm" : "Hold button"})",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"))
                    ],
                  )
                ]),
          ),
        ));
  }
}
