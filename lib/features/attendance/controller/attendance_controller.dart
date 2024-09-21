import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/attendance_data.dart';
import '../data/response/attendance_response_model.dart';


class AttendanceController {
  DateTimeRange? selectedDateRange;
  final AttendanceApi attendanceApi;
  bool isLoading = false;
  List<Attendance> attendanceList = [];

  AttendanceController(this.attendanceApi);

  Future<void> pickDateRange(BuildContext context) async {
    final now = DateTime.now();

    // Set the first date to a reasonable limit (e.g., 1 year ago)
    final firstDate = DateTime(now.year - 1, 1, 1);
    final lastDate = DateTime(now.year, now.month + 1, 0); // Last day of the current month

    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDateRange: selectedDateRange,
      helpText: 'Select Date Range',
    );

    if (picked != null) {
      // Ensure selected dates are within the same month
      if (picked.start.month == picked.end.month && picked.start.year == picked.end.year) {
        selectedDateRange = picked;
      } else {
        // Show an error message if the date range is not valid
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a date range within the same month.')),
        );
      }
    }
  }


  Future<void> loadDefaultAttendance() async {
    isLoading = true;
    final now = DateTime.now();
    final lastMonth = DateTime(now.year, now.month - 1);

    attendanceList = await fetchAttendance(
        lastMonth.year.toString(),
        lastMonth.month.toString(),
        "01D027673" // Replace with actual username
    );
    isLoading = false;

  }

  Future<void> fetchAttendanceForSelectedDateRange() async {
    if (selectedDateRange != null) {
        isLoading = true;
      attendanceList = await fetchAttendance(
          selectedDateRange!.start.year.toString(),
          selectedDateRange!.start.month.toString(),
          "01D027673" // Replace with actual username
      );
        isLoading = false;
    }
  }



  Future<List<Attendance>> fetchAttendance(String year, String month, String username) async {
    return await attendanceApi.fetchAttendance(year, month, username);
  }

  Future<void> fetchDefaultAttendance(String username) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = now;

    selectedDateRange = DateTimeRange(start: startOfMonth, end: endOfMonth);
    await fetchAttendance(startOfMonth.year.toString(), startOfMonth.month.toString(), username);
  }


  String formatTime(String dateTimeString) {
    try {
      // Create a DateFormat for the incoming date format
      final DateFormat inputFormat = DateFormat("M/d/yyyy h:mm:ss a");

      // Parse the dateTimeString to a DateTime object
      final DateTime dateTime = inputFormat.parse(dateTimeString);

      // Return the formatted time
      return DateFormat.jm().format(dateTime); // e.g., "12:00 AM"
    } catch (e) {
      // Handle parsing error
      return "Invalid Time"; // Return a default value or handle as needed
    }
  }


  Color getStatusColor(String status) {
    switch (status) {
      case 'P':
        return Colors.green; // Present
      case 'PI':
      case 'PO':
        return Colors.yellow; // Punched In / Punched Out
      case 'A':
        return Colors.red; // Absent
      case 'L':
        return Colors.blue; // Leave
      case 'GEO':
        return Colors.orange; // Geo Punch
      case 'H':
      case 'WO':
        return Colors.grey.shade400; // Holiday / Weekly Off
      default:
        return Colors.white; // Default
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'P':
      case 'A':
      case 'L':
      case 'GEO':
        return Colors.white; // For darker backgrounds
      case 'PI':
      case 'PO':
      case 'H':
      case 'WO':
        return Colors.black; // For lighter backgrounds
      default:
        return Colors.black; // Default text color
    }
  }

  String getStatusText(String status, String description) {
    switch (status) {
      case 'P':
        return 'Present';
      case 'PI':
        return 'Punched In';
      case 'PO':
        return 'Punched Out';
      case 'A':
        return 'Absent';
      case 'L':
        return 'Leave';
      case 'GEO':
        return 'Geo Punch';
      case 'H':
        return description;
      case 'WO':
        return 'Weekly Off';
      default:
        return status; // Default to attendance description
    }
  }


}
