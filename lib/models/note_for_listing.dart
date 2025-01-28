// class NoteForListing {
//   late String noteID;
//   late String noteTitle;
//   late String noteContent;
//   late DateTime createDateTime;
//   late DateTime lasteditDateTime;

//   NoteForListing(
//     this.noteID,
//     this.noteTitle,
//     this.noteContent,
//     this.createDateTime,
//     this.lasteditDateTime,
//   );
// }


class NoteForListing {
  final int id;
  final String title;
  final String content;
  final DateTime updatedAt;

  NoteForListing({
    required this.id,
    required this.title,
    required this.content,
    required this.updatedAt,
  });

  factory NoteForListing.fromJson(Map<String, dynamic> json) {
    return NoteForListing(
      id: json['id'] as int,
      title: json['title'],
      content: json['content'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}