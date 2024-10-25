class MeetupBO {
  List<String> images;
  int saveCount;
  int favCount;
  double rating;
  String actorName;
  int mins;
  int fees;
  String about;
  int top;

  MeetupBO({
    required this.top,
    required this.images,
    required this.saveCount,
    required this.favCount,
    required this.rating,
    required this.actorName,
    required this.mins,
    required this.fees,
    required this.about,
  });
}
