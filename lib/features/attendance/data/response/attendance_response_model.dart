class Attendance {
  final String rollCd;
  final String empCd;
  final String status;
  final String desc;
  final String date;
  final String actualInTime;
  final String actualOutTime;
  final String totalWorkHr;

  Attendance({
    required this.rollCd,
    required this.empCd,
    required this.status,
    required this.desc,
    required this.date,
    required this.actualInTime,
    required this.actualOutTime,
    required this.totalWorkHr,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      rollCd: json['ProPubStrRollCd'],
      empCd: json['ProPubStrEmpcd'],
      status: json['ProPubStrStatus'],
      desc: json['ProPubStrDesc'],
      date: json['ProPubStrDate'],
      actualInTime: json['ProPubStrActualInTime'],
      actualOutTime: json['ProPubStrActualOutTime'],
      totalWorkHr: json['ProPubStrTotalWorkHr'],
    );
  }
}
