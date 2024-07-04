// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignModel {
  String? name;
  String? id;
  String? email;
  String? token;
  SignModel({
    this.name,
    this.id,
    this.email,
    this.token,
  });

  SignModel copyWith({
    String? name,
    String? id,
    String? email,
    String? token,
  }) {
    return SignModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
      'token': token,
    };
  }

  factory SignModel.fromMap(Map<String, dynamic> map) {
    return SignModel(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'].toString() as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignModel.fromJson(String source) =>
      SignModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignModel(name: $name, id: $id, email: $email, token: $token)';
  }

  @override
  bool operator ==(covariant SignModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.email == email &&
        other.token == token;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ email.hashCode ^ token.hashCode;
  }
}
