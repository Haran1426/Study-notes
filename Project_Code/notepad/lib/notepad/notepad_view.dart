import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'note.dart';

import "package:url_launcher/url_launcher.dart";

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

    if (content.isEmpty) return;


    final note = Note(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      content: content,
      alias: alias.isEmpty ? null : alias,
    );

    setState(() {
      _notes.add(note);
    });


    _contentController.clear();
    _aliasController.clear();
  }

  Future<void> _copyNote(String content) async {
    await Clipboard.setData(
      ClipboardData(text: content),
    );
  }
  void _delNote(String id) {
    setState(() {
      _notes.removeWhere((note) => note.id == id);
    });
  }


  bool _isLink(String content) {
    final uri = Uri.tryParse(content.trim());

    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }
  Future<void> _openLink(String content) async {
    final uri = Uri.parse(content);

    await launchUrl(uri);
  }

  @override
  void dispose() {
    _contentController.dispose();
    _aliasController.dispose();
    super.dispose();
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
                          hintText: '텍스트 또는 링크(Ctrl+Enter로 추가)',
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
                      itemBuilder: (context, index){
                        final note = _notes[index];
                        final alias = note.alias;

                        final isLink = _isLink(note.content);

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: isLink
                                          ? () => _openLink(note.content)
                                          : null,
                                      child: Text(
                                        note.content,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isLink ? Colors.blue : Colors.black,
                                          decoration: isLink
                                              ? TextDecoration.underline
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),

                                    if (alias != null)
                                      const SizedBox(height: 4),

                                    if (alias != null)
                                      Text(
                                        alias,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              OutlinedButton(
                                onPressed: () {
                                  _copyNote(note.content);
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.grey.shade700,
                                  side: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  minimumSize: const Size(56, 42),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('복사'),
                              ),

                              const SizedBox(width: 8),

                              OutlinedButton(
                                onPressed: () {
                                  _delNote(note.id);
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red.shade600,
                                  side: BorderSide(
                                    color: Colors.red.shade200,
                                  ),
                                  minimumSize: const Size(56, 42),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('삭제'),
                              ),
                            ],
                          ),
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
