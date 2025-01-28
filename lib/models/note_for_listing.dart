class NoteForListing {
  late String noteID;
  late String noteTitle;
  late String noteContent;
  late DateTime createDateTime;
  late DateTime lasteditDateTime;

  NoteForListing(
    this.noteID,
    this.noteTitle,
    this.noteContent,
    this.createDateTime,
    this.lasteditDateTime,
  );
}