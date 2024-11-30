class PasswordResetResponse {
  final String message;

  PasswordResetResponse({required this.message});

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) {
    return PasswordResetResponse(message: json['Message'] ?? '');
  }
}
