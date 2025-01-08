class PostResponse {
  final String message;
  final bool isSuccess;

  PostResponse({required this.message, required this.isSuccess});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      isSuccess: json['IsSuccess'] ?? false,
      message: json["Message"] ?? 'N/A',
    );
  }
}
