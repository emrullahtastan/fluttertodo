class NoteForListing {
  String NoteId;
  String NoteTitle;
  DateTime CreateDateTime;
  DateTime LatestEditDateTime;

  NoteForListing(
      {this.NoteId,
      this.NoteTitle,
      this.CreateDateTime,
      this.LatestEditDateTime});

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
      NoteId: item['id'].toString(),
      NoteTitle: item['noteTitle'],
      CreateDateTime: DateTime.parse(item['createdDateTime']),
      LatestEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
