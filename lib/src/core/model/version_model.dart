// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VersionModel {
  final int id;
  final String version;
  final bool beta;
  VersionModel({
    required this.id,
    required this.version,
    required this.beta,
  });

  VersionModel copyWith({
    int? id,
    String? version,
    bool? beta,
  }) {
    return VersionModel(
      id: id ?? this.id,
      version: version ?? this.version,
      beta: beta ?? this.beta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'version': version,
      'beta': beta,
    };
  }

  factory VersionModel.fromMap(Map<String, dynamic> map) {
    return VersionModel(
      id: map['id'] as int,
      version: map['version'] as String,
      beta: map['beta'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionModel.fromJson(String source) =>
      VersionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VersionModel(id: $id, version: $version, beta: $beta)';

  @override
  bool operator ==(covariant VersionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.version == version &&
      other.beta == beta;
  }

  @override
  int get hashCode => id.hashCode ^ version.hashCode ^ beta.hashCode;
}
