class UserDetails {
  final bool isActive;
  final String emailAddress;
  final String name;
  final String profileImage;

  UserDetails({
    required this.isActive,
    required this.emailAddress,
    required this.name,
    required this.profileImage,
  });

  factory UserDetails.fromFirestore(Map<String, dynamic> data) {
    return UserDetails(
      isActive: data['isActive'] ?? false,
      emailAddress: data['emailAddress'] ?? '',
      name: data['name'] ?? '',
      profileImage: data['profileImage'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isActive': isActive,
      'emailAddress': emailAddress,
      'name': name,
      'profileImage': profileImage,
    };
  }

  UserDetails copyWith({
    bool? isActive,
    String? emailAddress,
    String? name,
    String? profileImage,
  }) {
    return UserDetails(
      isActive: isActive ?? this.isActive,
      emailAddress: emailAddress ?? this.emailAddress,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
