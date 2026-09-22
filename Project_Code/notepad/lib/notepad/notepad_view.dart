import 'package:flutter/material.dart';
import 'note.dart';


class NotepadView extends StatefulWidget {
  const NotepadView({super.key});

  @override
  State<NotepadView> createState() => _NotepadViewState();
}

class _NotepadViewState extends State<NotepadView> {

  final _contentController = TextEditingController();
  final _aliasController = TextEditingController();

  final List<Note> _notes = [];


  void _addNote() {
    final content = _contentController.text.trim();
    final alias = _aliasController.text.trim();
    print(content);
    print(alias);


    final note = Note(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      content: content,
      alias: alias.isEmpty ? null : alias,
    );

    setState(() {
      _notes.add(note);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDBCF1),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Notepad',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: Column(
                    children: [
                       TextField(
                         controller: _contentController,
                        minLines: 2,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: '텍스트 또는 링크(ctl+Enter 로 추가)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _aliasController,
                              minLines: 1,
                              maxLines: 2,
                              decoration: InputDecoration(
                                hintText: '별칭(선택)',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _addNote,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              minimumSize: const Size(60, 55),
                            ),
                            child: const Text('추가'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];

                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Text(note.content),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
