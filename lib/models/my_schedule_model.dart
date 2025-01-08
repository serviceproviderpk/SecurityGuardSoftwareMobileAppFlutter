class MyScheduleModel {
  final String guardName;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String guardShift;
  final int phoneNumber;
  final String address;
  final String shiftStartTime;
  final String shiftEndTime;

  MyScheduleModel({
    required this.guardName,
    required this.dateFrom,
    required this.dateTo,
    required this.guardShift,
    required this.phoneNumber,
    required this.address,
    required this.shiftStartTime,
    required this.shiftEndTime,
  });

  factory MyScheduleModel.fromJson(Map<String, dynamic> json) {
    return MyScheduleModel(
      guardName: json['GuardName'] ?? 'N/A',
      dateFrom: DateTime.tryParse(json['DateFrom'] ?? '') ?? DateTime(0),
      dateTo: DateTime.tryParse(json['DateTo'] ?? '') ?? DateTime(0),
      guardShift: json['GuardShift'] ?? 'N/A',
      phoneNumber: int.tryParse(json['Phone']?.toString() ?? '0') ?? 0,
      address: json['Address'] ?? 'N/A',
      shiftStartTime: json['ShiftStartTime'] ?? '00:00:00',
      shiftEndTime: json['ShiftEndTime'] ?? '00:00:00',
    );
  }
}
