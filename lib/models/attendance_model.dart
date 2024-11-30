class Attendance {
  final String attendanceDate;
  final String remarks;
  final List<AttendanceDetail> details;

  Attendance({
    required this.attendanceDate,
    required this.remarks,
    required this.details,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      attendanceDate: json['AttendanceDate'] ?? '',
      remarks: json['Remarks'] ?? '',
      details: (json['AttendanceDetails'] as List)
          .map((detail) => AttendanceDetail.fromJson(detail))
          .toList(),
    );
  }
}

class AttendanceDetail {
  final String checkInTime;
  final String checkOutTime;
  final String locationIP;
  final String hoursWorked;

  AttendanceDetail({
    required this.checkInTime,
    required this.checkOutTime,
    required this.locationIP,
    required this.hoursWorked,
  });

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) {
    return AttendanceDetail(
        checkInTime: json['CheckInTime']?.toString() ?? 'N/A',
        checkOutTime: json['CheckOutTime']?.toString() ?? 'N/A',
        locationIP: json['LocationIP']?.toString() ?? 'N/A',
        hoursWorked: json['HoursWorked']?.toString() ?? '0');
  }
}
