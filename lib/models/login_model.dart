class LogInResponse {
  final String message;
  final bool isSuccess;

  LogInResponse({required this.message, required this.isSuccess});

  factory LogInResponse.fromJson(Map<String, dynamic> json) {
    return LogInResponse(
        isSuccess: json['IsSuccess'] ?? false, message: json["Message"]);
  }
}
