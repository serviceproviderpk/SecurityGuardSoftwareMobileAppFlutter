class MyScheduleModel {
  final String guardName;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final String guardShift;
  final int phoneNumber;
  final String address;
  final String shiftStartTime;
  final String shiftEndTime;

  MyScheduleModel({
    required this.guardName,
    this.dateFrom,
    this.dateTo,
    required this.guardShift,
    required this.phoneNumber,
    required this.address,
    required this.shiftStartTime,
    required this.shiftEndTime,
  });

  factory MyScheduleModel.fromJson(Map<String, dynamic> json) {
    return MyScheduleModel(
      guardName: json['GuardName'] ?? 'Unknown',
      dateFrom:
          json['DateFrom'] != null ? DateTime.tryParse(json['DateFrom']) : null,
      dateTo: json['DateTo'] != null ? DateTime.tryParse(json['DateTo']) : null,
      guardShift: json['GuardShift'] ?? 'N/A',
      phoneNumber: int.tryParse(json['Phone']?.toString() ?? '0') ?? 0,
      address: json['Address'] ?? 'N/A',
      shiftStartTime: json['ShiftStartTime'] ?? '00:00:00',
      shiftEndTime: json['ShiftEndTime'] ?? '00:00:00',
    );
  }
}
