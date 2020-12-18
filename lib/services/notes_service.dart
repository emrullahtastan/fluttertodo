import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/api_response.dart';
import 'package:flutter_app/models/note.dart';
import 'package:flutter_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://192.168.1.8:6060/api/';
  static const headers = {'userId': "1"};

  Future<APIResponse<List<NoteForListing>>> getNotesList() async {
    return http.get(API + 'notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }


  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<Note>(error: true, errorMessage: 'An error occured'));
  }



}
