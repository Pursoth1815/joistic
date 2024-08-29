class CompanyListModel {
  final String companyId;
  final String title;
  final String description;
  final String logo;
  final bool isApplied;

  CompanyListModel({
    required this.companyId,
    required this.title,
    required this.description,
    required this.logo,
    this.isApplied = false,
  });

  CompanyListModel copyWith({
    String? companyId,
    String? title,
    String? description,
    String? logo,
    bool? isApplied,
  }) {
    return CompanyListModel(
      companyId: companyId ?? this.companyId,
      title: title ?? this.title,
      description: description ?? this.description,
      logo: logo ?? this.logo,
      isApplied: isApplied ?? this.isApplied,
    );
  }

  factory CompanyListModel.fromJson(Map<String, dynamic> json) {
    final titleText = json['title'].toString();

    return CompanyListModel(
      companyId: json['id'].toString(),
      title: titleText.split(' ').take(2).join(' '),
      description: titleText,
      logo: json['thumbnailUrl'].toString(),
      isApplied: json['is_applied'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'title': title,
      'description': description,
      'logo': logo,
      'is_applied': isApplied,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyListModel &&
        other.companyId == companyId &&
        other.title == title &&
        other.description == description &&
        other.logo == logo &&
        other.isApplied == isApplied;
  }

  @override
  int get hashCode {
    return companyId.hashCode ^ title.hashCode ^ description.hashCode ^ logo.hashCode ^ isApplied.hashCode;
  }

  @override
  String toString() {
    return 'CompanyListModel(companyId: $companyId, title: $title, description: $description, logo: $logo, isApplied: $isApplied)';
  }
}
