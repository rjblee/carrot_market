import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  // Equatable allows value equality check
  final String? uid;
  final String? name;
  final String? email;

  const UserModel({this.uid, this.name, this.email});

  @override
  // List of properties used to determine if two objects are equal
  // If all properties in props match, then the objects are considered equal
  List<Object?> get props => [uid, name, email];
}
