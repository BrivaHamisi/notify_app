import 'dart:convert';
import 'package:notify_app/models/api_response.dart';
import 'package:notify_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const String API = 'http://10.0.2.2:3000';
  final http.Client _client;

  NotesService({http.Client? client}) : _client = client ?? http.Client();

Future<APIResponse<List<NoteForListing>>> getNoteList() async {
  try {
    print('Requesting: $API/notes'); // Print the URL being called
    
    final response = await _client.get(
      Uri.parse('$API/notes'),
      headers: {'Content-Type': 'application/json'},
    );

    print('Status Code: ${response.statusCode}'); // Print status code
    print('Response Body: ${response.body}'); // Print raw response

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print('Decoded Data: $data'); // Print decoded JSON
      
      final notes = data.map((item) => NoteForListing.fromJson(item)).toList();
      print('Parsed Notes: ${notes.length}'); // Print number of notes parsed
      
      return APIResponse<List<NoteForListing>>(data: notes);
    }
    
    print('Non-200 response received'); // Print on non-200 status
    return APIResponse<List<NoteForListing>>(error: true);
  } catch (e) {
    print('Error in getNoteList: $e'); // Print any errors
    return APIResponse<List<NoteForListing>>(error: true);
  }
}

  // Get a single note
  Future<APIResponse<NoteForListing>> getNote(int noteId) async {
    try {
      final response = await _client.get(
        Uri.parse('$API/notes/$noteId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return APIResponse<NoteForListing>(
          data: NoteForListing.fromJson(jsonData),
        );
      }
      
      return APIResponse<NoteForListing>(
        error: true,
        errorMessage: 'Failed to fetch note: ${response.statusCode}',
      );
    } catch (e) {
      return APIResponse<NoteForListing>(
        error: true,
        errorMessage: 'An error occurred: ${e.toString()}',
      );
    }
  }

  // Create a new note
  Future<APIResponse<bool>> createNote(String title, String content) async {
    try {
      final response = await _client.post(
        Uri.parse('$API/notes'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': title,
          'content': content,
        }),
      );

      if (response.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      
      return APIResponse<bool>(
        error: true,
        errorMessage: 'Failed to create note: ${response.statusCode}',
      );
    } catch (e) {
      return APIResponse<bool>(
        error: true,
        errorMessage: 'An error occurred: ${e.toString()}',
      );
    }
  }

  // Update an existing note
  Future<APIResponse<bool>> updateNote(int noteId, String title, String content) async {
    try {
      final response = await _client.put(
        Uri.parse('$API/notes/$noteId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': title,
          'content': content,
        }),
      );

      if (response.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      
      return APIResponse<bool>(
        error: true,
        errorMessage: 'Failed to update note: ${response.statusCode}',
      );
    } catch (e) {
      return APIResponse<bool>(
        error: true,
        errorMessage: 'An error occurred: ${e.toString()}',
      );
    }
  }

  // Delete a note
  Future<APIResponse<bool>> deleteNote(int noteId) async {
    try {
      final response = await _client.delete(
        Uri.parse('$API/notes/$noteId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      
      return APIResponse<bool>(
        error: true,
        errorMessage: 'Failed to delete note: ${response.statusCode}',
      );
    } catch (e) {
      return APIResponse<bool>(
        error: true,
        errorMessage: 'An error occurred: ${e.toString()}',
      );
    }
  }
}