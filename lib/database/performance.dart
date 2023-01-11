class Performance implements Comparable<Performance> {
  final int match;
  final int team;
  final String nickname;

  const Performance({
    required this.match,
    required this.team,
    required this.nickname,
  });

  Map<String, dynamic> toMap() {
    return {"match": match, "team": team, "nickname": nickname};
  }

  @override
  String toString() {
    return 'Performance{match:$match, team:$team, nickname:$nickname}';
  }

  @override
  int compareTo(Performance other) {
    if (other.match > match) {
      return -1;
    } else if (other.match < match) {
      return 1;
    }
    return 0; //same match
  }
}
