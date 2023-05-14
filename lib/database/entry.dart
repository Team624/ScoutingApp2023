class Entry implements Comparable<Entry> {
  int match = 1;
  int team = 1;
  String content = "";

  Entry(this.match, this.team, this.content);

  Entry.complete(
      {required this.match, required this.team, required this.content});

  @override
  int compareTo(Entry other) {
    if (other.match > match) {
      return -1;
    } else if (other.match < match) {
      return 1;
    }
    return 0;
  }

  Map<String, dynamic> toMap() {
    return {"match": match, "team": team, "content": content};
  }

  @override
  String toString() {
    return content;
  }
}
