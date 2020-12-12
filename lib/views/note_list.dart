import 'package:flutter/material.dart';
import 'package:flutter_app/models/note_for_listing.dart';
import 'package:flutter_app/views/note_delete.dart';
import 'package:flutter_app/views/note_modify.dart';
import 'package:intl/intl.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForListing(
        NoteID: "1",
        NoteTitle: "Note 1",
        CreateDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now()),
    new NoteForListing(
        NoteID: "2",
        NoteTitle: "Note 2",
        CreateDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now()),
    new NoteForListing(
        NoteID: "3",
        NoteTitle: "Note 3",
        CreateDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].NoteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => NoteDelete());
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(Icons.delete, color: Colors.white),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(notes[index].NoteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              subtitle: Text(
                  'Last edited on ${DateFormat("dd.MM.yyyy kk:mm").format(notes[index].latestEditDateTime)})'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(
                          noteID: notes[index].NoteID,
                        )));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
