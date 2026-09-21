class Note {
  const Note({
    required this.id,
    required this.content,
    this.alias,
  });

  final String id;
  final String content;
  final String? alias;
}