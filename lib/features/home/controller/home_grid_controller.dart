import 'package:flutter/material.dart';
import 'package:projects/features/attendance/pages/attendance_home_screen.dart';
import 'package:projects/features/holidayList/pages/holidaylist_screen.dart';
import 'package:projects/features/home/pages/Home_screen.dart';
import 'package:projects/features/leave/pages/leave_home_screen.dart';

class HomeController{

  void navigateToGridModule(BuildContext context, String moduleName) {
    if(moduleName == 'Attendance'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AttendanceHomeScreen()));
    }else if(moduleName == 'Leave') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LeaveHomeScreen()));
    }else if(moduleName == 'QR Punch') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page3()));
    }else if(moduleName == 'Holiday List') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HolidayListScreen()));
    }else if(moduleName == 'Website') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page5()));
    }else if(moduleName == 'Download') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page5()));
    }else if(moduleName == 'Geo Fencing') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page5()));
    }else {
      // Default or fallback behavior
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No screen found for $moduleName')),
      );
    }
  }
}