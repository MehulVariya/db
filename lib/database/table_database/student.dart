const String tableName='students';

class StudentField{
  static final List<String> values = [id,name,number];
  static const String id = '_id';
  static const String name = 'name';
  static const String number = 'number';
}

class Student{
  final int? id;
  final String name;
  final String number;
  const Student({
    this.id,
    required this.name,
    required this.number
    });
  Map<String,Object?> toMap() =>{
    StudentField.id:id,
    StudentField.name:name,
    StudentField.number:number,
  };
  Student copy({
      int? id,
      String? name,
    String? number,
    })=> Student(
        id:id ?? this.id,
        name:name ?? this.name,
        number:number ?? this.number,
    );
  static Student mapFromObject(Map<String,Object?> maps) => Student(
    id:maps[StudentField.id] as int?,
    name:maps[StudentField.name] as String,
    number:maps[StudentField.number] as String,
  );
}