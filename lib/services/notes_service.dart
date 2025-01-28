import 'package:notify_app/models/note_for_listing.dart';

class NotesService {
  List<NoteForListing> getNoteList() {
    return [
      NoteForListing(
        "1",
        "Note 1",
        "Note Content 1",
        DateTime.now(),
        DateTime.now(),
      ),
      NoteForListing(
        "2",
        "Note 2",
        "Note Content 2",
        DateTime.now(),
        DateTime.now(),
      ),
      NoteForListing(
        "3",
        "Note 3",
        "Note Content 3",
        DateTime.now(),
        DateTime.now(),
      ),
    ];
  }
}
