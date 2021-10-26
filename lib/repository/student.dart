class Student {
  final String id;
  final String name;

  Student(this.id, this.name);

  Map<String, String> toJson() {
    return {'id': id, 'name': name};
  }

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id']!,
        name = json['name']!;
}
