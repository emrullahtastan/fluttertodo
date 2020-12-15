import 'dart:convert';

import 'package:flutter_app/models/api_response.dart';
import 'package:flutter_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://192.168.1.8:6060/api/';
  static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() async {
    return http.get(API + 'notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
              NoteID: item['noteID'],
              NoteTitle: item['noteTitle'],
              CreateDateTime: DateTime.parse(item['createdDateTime']),
              latestEditDateTime: DateTime.parse(item['latestEditDateTime']));
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
