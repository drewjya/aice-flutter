// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VersionModel {
  final int id;
  final String version;
  VersionModel({
    required this.id,
    required this.version,
  });

  VersionModel copyWith({
    int? id,
    String? version,
  }) {
    return VersionModel(
      id: id ?? this.id,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'version': version,
    };
  }

  factory VersionModel.fromMap(Map<String, dynamic> map) {
    return VersionModel(
      id: map['id'] as int,
      version: map['version'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionModel.fromJson(String source) =>
      VersionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VersionModel(id: $id, version: $version)';

  @override
  bool operator ==(covariant VersionModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.version == version;
  }

  @override
  int get hashCode => id.hashCode ^ version.hashCode;
}
