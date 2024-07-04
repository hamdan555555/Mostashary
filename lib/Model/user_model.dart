import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Users {
   String? name;
   String? password;
   String? email;
   String? id;
  Users({
    this.name,
    this.password,
    this.email,
    this.id,
  });

  Users copyWith({
    String? name,
    String? password,
    String? email,
    String? id,
  }) {
    return Users(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'email': email,
      'id': id,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      id: map['id'] != null ? map['id'].toString() as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Users(name: $name, password: $password, email: $email, id: $id)';
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.password == password &&
      other.email == email &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      password.hashCode ^
      email.hashCode ^
      id.hashCode;
  }
}
