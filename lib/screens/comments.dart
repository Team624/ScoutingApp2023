// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../database/commentData.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentPage> {
  final scoutController = TextEditingController();
  final teamController = TextEditingController();
  final matchController = TextEditingController();

  @override
  void dispose() {
    scoutController.dispose();
    teamController.dispose();
    matchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedList = List.filled(DataModel.comments.length, 'N/A');
    super.initState();
  }

  late List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Scrollbar(
          child: ListView(
            children: [
              SizedBox(height: 8),
              Container(
                width: 285,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: const Color(0xff04F000),
                ),
                child: Center(
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 35,
                      color: Colors.black,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 225,
                  vertical: 16,
                ),
                child: TextField(
                  controller: scoutController,
                  decoration: InputDecoration(
                    labelText: "Scout's Name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 225,
                  vertical: 16,
                ),
                child: TextField(
                  controller: teamController,
                  maxLength: 5,
                  decoration: InputDecoration(
                    labelText: 'Team Number',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 225,
                  vertical: 16,
                ),
                child: TextField(
                  maxLength: 2,
                  controller: matchController,
                  decoration: InputDecoration(
                    labelText: 'Match Number',
                  ),
                ),
              ),
              ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: DataModel.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 10,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              DataModel.comments[index].commentName.toString()),
                          DropdownButton<String>(
                            value: selectedList[index],
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: Colors.black),
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: Colors.greenAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedList[index] = newValue!;
                              });
                            },
                            items: DataModel.comments[index].options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 220, right: 220, top: 50),
                child: TextButton(
                  onPressed: () {
                    matchController.text =
                        (int.parse(matchController.text) + 1).toString();
                    teamController.text = '';
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff04F000),
                    elevation: 8,
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 20, left: 27, right: 27),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
