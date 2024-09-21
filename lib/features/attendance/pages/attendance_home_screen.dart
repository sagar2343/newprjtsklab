import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/features/widgets/custom_appbar.dart';
import '../controller/attendance_controller.dart';
import '../data/attendance_data.dart';
import '../data/response/attendance_response_model.dart';

class AttendanceHomeScreen extends StatefulWidget {
  const AttendanceHomeScreen({super.key});

  @override
  State<AttendanceHomeScreen> createState() => _AttendanceHomeScreenState();
}

class _AttendanceHomeScreenState extends State<AttendanceHomeScreen> {
  final AttendanceController _attendanceController = AttendanceController(AttendanceApi());
  List<Attendance> attendanceList = [];
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeAttendance();
  }


  Future<void> _initializeAttendance() async {
    await _attendanceController.loadDefaultAttendance();
    setState(() {
      attendanceList = _attendanceController.attendanceList;
    });
  }





  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Attendance'),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await _attendanceController.pickDateRange(context);
              if (_attendanceController.selectedDateRange != null) {
                setState(() {
                  _attendanceController.isLoading = true; // Set loading to true
                });
                await _attendanceController.fetchAttendanceForSelectedDateRange();
                setState(() {
                  attendanceList = _attendanceController.attendanceList;
                  _attendanceController.isLoading = false; // Set loading to false
                });
              }
            },

            child: Card(
              color: Colors.white,
              elevation: 1,
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                height: h * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _attendanceController.selectedDateRange == null
                          ? 'Tap to Select Date Range'
                          : 'Selected: ${DateFormat('dd/MM/yyyy').format(_attendanceController.selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(_attendanceController.selectedDateRange!.end)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _attendanceController.isLoading
              ? const Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
            child: ListView.builder(
              itemCount: attendanceList.length,
              itemBuilder: (context, index) {
                final attendance = attendanceList[index];
                final statusColor = _attendanceController.getStatusColor(attendance.status);
                final statusText = _attendanceController.getStatusText(attendance.status, attendance.desc);
                final statusTextColor = _attendanceController.getStatusTextColor(attendance.status);
                return Card(
                  margin: const EdgeInsets.all(5),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.symmetric(vertical: BorderSide(color: statusColor, width: 5)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(statusText, style: TextStyle(fontSize: 14, color: statusTextColor)),
                            ),
                            Text('Date: ${attendance.date}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('In Time', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                                Text(_attendanceController.formatTime(attendance.actualInTime), style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                            const SizedBox(height: 40, child: VerticalDivider(width: 10, thickness: 1, color: Colors.grey)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Out Time', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                                Text(_attendanceController.formatTime(attendance.actualOutTime), style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                            const SizedBox(height: 40, child: VerticalDivider(width: 10, thickness: 1, color: Colors.grey)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Total', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                                Text(attendance.totalWorkHr, style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
