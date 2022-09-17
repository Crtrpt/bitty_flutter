// ignore_for_file: non_constant_identifier_names

import 'user.dart';

class Contact {
  Contact(
      {this.user_id,
      this.target_id,
      this.session_id,
      this.name,
      this.created_at});
  final String? user_id;
  final String? target_id;
  final String? session_id;
  final String? name;
  final String? created_at;
  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
      user_id: json['user_id'] as String?,
      target_id: json['target_id'] as String?,
      session_id: json['session_id'] as String?,
      name: json['name'] as String?,
      created_at: json['created_at'] as String?);
}

class ContactList {
  ContactList({this.contact, this.user});
  Contact? contact;
  User? user;

  factory ContactList.fronJson(Map<String, dynamic> json) => ContactList(
      contact: Contact.fromJson(json['contact']),
      user: User.fromJson(json['user']));
}
