class Message {
  final String guardName;
  final String alertMessage;
  final String alertDateTime;

  Message({
    required this.guardName,
    required this.alertMessage,
    required this.alertDateTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      guardName: json['GuardName'] ?? 'Unknown Guard',
      alertMessage: json['AlertMessage'] ?? '',
      alertDateTime: json['AlertDateTime'] ?? '',
    );
  }
}
