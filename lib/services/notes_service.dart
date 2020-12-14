import 'dart:convert';

import 'package:flutter_app/models/api_response.dart';
import 'package:flutter_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://192.168.1.8:7070';
  static const headers = {'apiKey': 'asdf'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    // ignore: missing_return
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = new NoteForListing(
            NoteID: item['noteID'],
            NoteTitle: item['noteTitle'],
            CreateDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
    ;
  }
}
