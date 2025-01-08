import 'package:intl/intl.dart';

class MyLeavesModel {
  final String guardName;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final String leaveType;
  final String shiftType;

  MyLeavesModel({
    required this.guardName,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.leaveType,
    required this.shiftType,
  });

  String get formattedFromDate =>
      DateFormat('dd/MM/yyyy hh:mm a').format(fromDate);

  String get formattedToDate => DateFormat('dd/MM/yyyy hh:mm a').format(toDate);

  factory MyLeavesModel.fromJson(Map<String, dynamic> json) {
    DateTime parseDate(String date) {
      try {
        return DateFormat('MM/dd/yyyy HH:mm:ss').parse(date);
      } catch (e) {
        return DateTime(0);
      }
    }

    return MyLeavesModel(
      guardName: json['GuardName'] ?? 'N/A',
      fromDate: parseDate(json['FromDate'] ?? ''),
      toDate: parseDate(json['ToDate'] ?? ''),
      shiftType: json['ShiftType'] ?? 'N/A',
      leaveType: json['leave_type_name'] ?? 'N/A',
      reason: json['ReasonOfLeave'] ?? 'N/A',
    );
  }
}
