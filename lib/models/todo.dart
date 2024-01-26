//   //
//  Import LIBRARIES
//  Import FILES
//  PARTS
//  PROVIDERS

//  //  /

class Todo {
  final String id;
  final String title;
  final String body;

  Todo({
    required this.id,
    required this.title,
    required this.body,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? body,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'body': body,
  //   };
  // }

  // factory Todo.fromMap(Map<String, dynamic> map) {
  //   return Todo(
  //     id: map['id'] ?? '',
  //     title: map['title'] ?? '',
  //     body: map['body'] ?? '',
  //   );
  // }
}
