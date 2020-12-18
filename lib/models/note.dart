class Note {
  String NoteId;
  String NoteTitle;
  String NoteContent;
  DateTime CreatedDateTime;
  DateTime LatestEditDateTime;

  Note(
      {this.NoteId,
      this.NoteTitle,
      this.NoteContent,
      this.CreatedDateTime,
      this.LatestEditDateTime});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
      NoteId: item['noteID'],
      NoteTitle: item['noteTitle'],
      NoteContent: item['noteContent'],
      CreatedDateTime: DateTime.parse(item['createdDateTime']),
      LatestEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
