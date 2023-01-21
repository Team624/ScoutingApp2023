class Comment {
  String commentName;
  List<String> options;

  Comment({required this.commentName, required this.options});
}

class DataModel {
  static List comments = [
    Comment(
      commentName: 'Play Defense',
      options: ['N/A', 'Yes', 'No'],
    ),
    Comment(
      commentName: 'Driver Skill',
      options: ['N/A', 'Bad', 'Average', 'Amazing'],
    ),
    Comment(
      commentName: 'Defending Level',
      options: ['N/A', 'Bad', 'Average', 'Amazing'],
    ),
    Comment(
      commentName: 'Links',
      options: ['N/A', '1', '2', '3'],
    ),
    Comment(
      commentName: 'Game Piece Specialization',
      options: ['N/A', 'Cubes', 'Cones', 'Both'],
    ),
  ];
}
