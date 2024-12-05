class CheckInOutResponse {
  final String message;
  final bool success;

  CheckInOutResponse({
    required this.message,
    required this.success,
  });

  factory CheckInOutResponse.fromJson(Map<String, dynamic> json) {
    return CheckInOutResponse(
      message: json['Message'],
      success: json['IsSuccess'] ?? false,
    );
  }
}
