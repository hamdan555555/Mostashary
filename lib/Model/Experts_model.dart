import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExpertsModel {
  int? id;
  String? name;
  String? email;
  String? image;
  String? experience;
  String? phone;
  String? address;
  String? type;
  ExpertsModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.experience,
    this.phone,
    this.address,
    this.type,
  });


  ExpertsModel copyWith({
    int? id,
    String? name,
    String? email,
    String? image,
    String? experience,
    String? phone,
    String? address,
    String? type,
  }) {
    return ExpertsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      experience: experience ?? this.experience,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'experience': experience,
      'phone': phone,
      'address': address,
      'type': type,
    };
  }

  factory ExpertsModel.fromMap(Map<String, dynamic> map) {
    return ExpertsModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      experience: map['experience'] != null ? map['experience'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpertsModel.fromJson(String source) => ExpertsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpertsModel(id: $id, name: $name, email: $email, image: $image, experience: $experience, phone: $phone, address: $address, type: $type)';
  }

  @override
  bool operator ==(covariant ExpertsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.image == image &&
      other.experience == experience &&
      other.phone == phone &&
      other.address == address &&
      other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      image.hashCode ^
      experience.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      type.hashCode;
  }
}
