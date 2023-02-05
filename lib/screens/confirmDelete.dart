import 'package:flutter/material.dart';

class ConfirmDelete extends StatefulWidget {
  List<int> indexes;
  ConfirmDelete(this.indexes);

  @override
  State<StatefulWidget> createState() => _ConfirmDeleteState(this.indexes);
}

class _ConfirmDeleteState extends State<ConfirmDelete> {
  List<int> indexes;
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
            leading: IconButton(
              icon: Image.asset(
                'assets/624logo.png',
              ),
              onPressed: () {},
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
                        onPressed: () {
                          if (longPressed) {
                            // teymur
                            Navigator.pop(context);
                          }
                        },
                        onLongPress: () {
                          setState(() {
                            this.longPressed = true;
                          });
                        },
                        child: Text(
                          "Yes, delete ${indexes.length} item${indexes.length == 1 ? "" : "s"}\n(${longPressed ? "Press again to confirm" : "Hold button"})",
                          textAlign: TextAlign.center,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"))
                    ],
                  )
                ]),
          ),
        ));
  }
}