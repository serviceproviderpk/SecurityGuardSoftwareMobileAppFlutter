class NotificationModel {
  final String userName;
  final String message;
  final String type;

  NotificationModel(
      {required this.userName, required this.message, required this.type});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      userName: json['UserName'] ?? 'No title',
      message: json['Message'] ?? 'No message',
      type: json['NotificationType'] ?? 'No Type',
    );
  }
}
