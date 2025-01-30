class Endpoint {
  static String baseUrl = "https://sss.futureminutes.com/api/";
  static String logIn = "${baseUrl}Login/ValidateUser";
  static String checkInOut = "${baseUrl}CheckInOut/SystemCheckInOut";
  static String forgetPassword = "${baseUrl}Forget/PasswordReset";

  // System Notifications
  static String myNotification = "${baseUrl}MyNotifictions/SystemNotifications";

  static String mySchedule = "${baseUrl}Schedules/GuardSchedules";
  static String myAttendance = "${baseUrl}CheckInOut/SystemCheckInOut";
  static String helpMeCall = "${baseUrl}HelpMe/Sendnow";

  // My Messages
  static String inboxMessages = "${baseUrl}SystemMessages/MyMessages";
  static String attendanceDetails = "${baseUrl}MyAttendanceHistory/Details";
  static String postNotification =
      "${baseUrl}SystemMessages/SystemSendMessages";
  static String myPetrol = "${baseUrl}Patrols/SystemPatrolsV2";
  static String myLeaves = "${baseUrl}LeaveBalance/MyLeaves";
  static String applyLeaves = "${baseUrl}ApplyLeave/LeaveRequest";
}
