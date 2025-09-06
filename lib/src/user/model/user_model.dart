import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable() // Json serialization and deserialization are automatically connected
class UserModel extends Equatable {
  // Equatable allows value equality check
  final String? uid;
  final String? name;
  final String? email;

  const UserModel({this.uid, this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  // List of properties used to determine if two objects are equal
  // If all properties in props match, then the objects are considered equal
  List<Object?> get props => [uid, name, email];
}
