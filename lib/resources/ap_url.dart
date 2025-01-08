class Endpoint {
  static String baseUrl = "https://sss.futureminutes.com/api/";
  static String logIn = "${baseUrl}Login/ValidateUser";
  static String checkInOut = "${baseUrl}CheckInOut/SystemCheckInOut";
  static String forgetPassword = "${baseUrl}Forget/PasswordReset";
  static String myNotification =
      "${baseUrl}MyNotifictions/SystemNotifications?GuardId=98";
  static String mySchedule = "${baseUrl}Schedules/GuardSchedules?GuardId=98";
  static String myAttendance = "${baseUrl}CheckInOut/SystemCheckInOut";
  static String inboxMessages =
      "${baseUrl}SystemMessages/MyMessages?GuardId=98";
  static String attendanceDetails = "${baseUrl}MyAttendanceHistory/Details";
  static String postNotification =
      "${baseUrl}SystemMessages/SystemSendMessages";
  static String myPetrol =
      "${baseUrl}Patrols/SystemPatrolsV2?GuardId=85&OrganizationId=146&BranchId=154";
  static String myLeaves =
      "${baseUrl}LeaveBalance/MyLeaves?OrganizationID=185&BranchID=186&loginUserId=187";
}
