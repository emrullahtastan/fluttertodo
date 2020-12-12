class NoteForListing {
  String NoteID;
  String NoteTitle;
  DateTime CreateDateTime;
  DateTime latestEditDateTime;

  NoteForListing(
      {this.NoteID,
      this.NoteTitle,
      this.CreateDateTime,
      this.latestEditDateTime});
}
