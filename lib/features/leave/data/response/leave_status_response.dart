class LeaveMonthYear {
  final String leaveMonthYear;
  final String month;
  final String year;

  LeaveMonthYear({
    required this.leaveMonthYear,
    required this.month,
    required this.year,
  });

  factory LeaveMonthYear.fromJson(Map<String, dynamic> json) {
    return LeaveMonthYear(
      leaveMonthYear: json['ProPubStrLeaveMonthYear'],
      month: json['ProPubStrMonth'],
      year: json['ProPubStrYear'],
    );
  }
}
