class InboxMessagesModel {
  final String guardName;
  final String alertMessage;
  final String alertDateTime;

  InboxMessagesModel({
    required this.guardName,
    required this.alertMessage,
    required this.alertDateTime,
  });

  factory InboxMessagesModel.fromJson(Map<String, dynamic> json) {
    return InboxMessagesModel(
      guardName: json['GuardName'] ?? 'Unknown Guard',
      alertMessage: json['AlertMessage'] ?? '',
      alertDateTime: json['AlertDateTime'] ?? '',
    );
  }
}
