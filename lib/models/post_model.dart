class PostResponse {
  final bool isSuccess;
  final String message;
  final dynamic content;

  PostResponse({
    required this.isSuccess,
    required this.message,
    required this.content,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      isSuccess: json['IsSuccess'],
      message: json['Message'] ?? 'No Message Provided',
      content: json['Content'] ?? 'No Content Provided',
    );
  }
}
