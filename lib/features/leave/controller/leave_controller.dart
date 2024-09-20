import 'package:flutter/material.dart';

import '../data/leave_status_data.dart';
import '../data/response/leave_details_response.dart';
import '../data/response/leave_status_response.dart';


class LeaveController {
  Future<List<LeaveMonthYear>> fetchLeaveMonths(String type, String employeeId) {
    return LeaveApiCall().fetchLeaveMonths(type, employeeId);
  }

  Future<List<LeaveDetails>> fetchLeaveDetails(String type, String employeeId, String month, String year) {
    return LeaveApiCall().fetchLeaveDetails(type, employeeId, month, year);
  }

  Future<Map<String, double>> calculateTotals(List<LeaveDetails> leaveDetails) async {
    double totalEncashed = 0;
    double totalElapsed = 0;
    double totalAvailable = 0;
    double totalTaken = 0;
    double totalTotal = 0;

    for (var detail in leaveDetails) {
      totalEncashed += double.parse(detail.proPubStrEncashed ?? '0');
      totalElapsed += double.parse(detail.proPubStrElapsed ?? '0');
      totalAvailable += double.parse(detail.proPubStrAvailableBalance ?? '0');
      totalTaken += double.parse(detail.proPubStrTknInYr ?? '0');
    }

    return {
      'totalEncashed': totalEncashed,
      'totalElapsed': totalElapsed,
      'totalAvailable': totalAvailable,
      'totalTaken': totalTaken,
      'totalTotal': totalEncashed + totalElapsed + totalAvailable + totalTaken,
    };
  }

  String? selectedDate;
  String? selectedMonth;
  String? selectedYear;

  List<String> getDropdownItems(List<LeaveMonthYear> leaveMonths) {
    return leaveMonths.map((e) => e.leaveMonthYear).toList();
  }

  void onDropdownChanged(
      String? newValue, List<LeaveMonthYear> leaveMonths, Function setStateCallback) {
    final selectedLeave = leaveMonths.firstWhere(
          (leaveMonth) => leaveMonth.leaveMonthYear == newValue,
    );

    setStateCallback(() {
      selectedDate = newValue!;
      selectedMonth = selectedLeave.month;
      selectedYear = selectedLeave.year;
    });
  }
}
