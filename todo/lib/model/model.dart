class Note {
  int? id;
  String? title;
  String? subtitle;
  String? description;
  Note({this.id, this.title, this.subtitle, this.description});
//convert a note into map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
    };
  }

//Extract a note object from  a map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      description: map['description'],
    );
  }
}
