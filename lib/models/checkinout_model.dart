class CheckInOutResponse {
  final bool isSuccess;
  final String? message;
  final String content;

  CheckInOutResponse({
    required this.isSuccess,
    this.message,
    required this.content,
  });

  factory CheckInOutResponse.fromJson(Map<String, dynamic> json) {
    return CheckInOutResponse(
      isSuccess: json["IsSuccess"] ?? false,
      message: json["Message"] ?? "No message provided",
      content: json["Content"] ?? "No content available",
    );
  }
}
