import 'package:flutter/material.dart';
import 'package:notify_app/models/note_for_listing.dart';
import 'package:notify_app/views/note_modify.dart';

class NoteList extends StatelessWidget {
  final notes = [
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

  String formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "My Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteModify(),
            ),
          );
        },
        backgroundColor: Colors.blue[700],
        elevation: 2,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      // Handle note tap
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  notes[index].noteTitle,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              PopupMenuButton(
                                icon: Icon(Icons.more_vert,
                                    color: Colors.grey[600]),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onSelected: (String value) {
                                  // Handle menu item selection here
                                  switch (value) {
                                    case 'edit':
                                      // Add your edit logic here
                                      print('Edit selected');
                                      break;
                                    case 'delete':
                                      // Add your delete logic here
                                      print('Delete selected');
                                      break;
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'edit',
                                    child: Text('Edit'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete'),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            notes[index].noteContent,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                formatDate(notes[index].lasteditDateTime),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
