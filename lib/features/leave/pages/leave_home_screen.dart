import 'package:flutter/material.dart';
import 'package:projects/features/widgets/custom_appbar.dart';

import '../../../config/theme/color.dart';

class LeaveHomeScreen extends StatefulWidget {
  const LeaveHomeScreen({super.key});

  @override
  State<LeaveHomeScreen> createState() => _LeaveHomeScreenState();
}

class _LeaveHomeScreenState extends State<LeaveHomeScreen> {

  final List<String> _dropdownItems = ['01/2024', '05/2024', '07/2024'];

  String _selectedDate = '01/2024'; // Default value for the dropdown


  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch items for the dropdown when the widget is initialized
  //   fetchDropdownItems();
  // }
  //
  // // This function will fetch the dropdown items dynamically
  // void fetchDropdownItems() async {
  //   // Example of where to fetch data from an API
  //   // For now, using a static list; replace with API call
  //   // Simulate network delay
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   // After fetching, update the state with new dropdown items
  //   setState(() {
  //     _dropdownItems = ['02/2024', '06/2024', '08/2024']; // Example fetched data
  //     _selectedDate = _dropdownItems[0]; // Set the default to the first fetched item
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Leaves'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Styled Dropdown Button
            SizedBox(height: h * 0.017),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leave Status >',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: h * 0.04,
                  width: w * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isDense: true,
                      value: _selectedDate,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                      elevation: 15,
                      style: const TextStyle(color: Colors.black,fontSize: 14),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDate = newValue!;
                        });
                      },
                      items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),


            ///Leaves circular data list
            SizedBox(height: h * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: sos2,
                        child: Center(child: Text('32.0',style: TextStyle(fontSize: 12,color: Colors.black))),
                      ),
                    ),
                    const Text('Total',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: calendar4,
                        child: Center(child: Text('0.0',style: TextStyle(fontSize: 12,color: Colors.black))),
                      ),
                    ),
                    const Text('Encased',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: calendar6,
                        child: Center(child: Text('1.0',style: TextStyle(fontSize: 12,color: Colors.black))),
                      ),
                    ),
                    const Text('Elapsed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: calendar1,
                        child: Center(child: Text('0.0',style: TextStyle(fontSize: 12,color: Colors.black))),
                      ),
                    ),
                    const Text('Taken',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: healthcare13,
                        child: Center(child: Text('33.0',style: TextStyle(fontSize: 12,color: Colors.black))),
                      ),
                    ),
                    const Text('Available',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(height: h * 0.01,color: Colors.grey[500],thickness: 1),
            ),


            ///Leave Apply >
            Text(
              'Leave Apply >',
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: h * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 4,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.29,
                    decoration: BoxDecoration(
                      color: lightblue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('21.0',style: TextStyle(color: Colors.black)),
                        Text('Earned Leave',style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.29,
                    decoration: BoxDecoration(
                        color: lightpink,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('5.0',style: TextStyle(color: Colors.black)),
                        Text('Casual Leave',style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.29,
                    decoration: BoxDecoration(
                        color: sos1,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('6.0',style: TextStyle(color: Colors.black)),
                        Text('Sick Leave',style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(height: h * 0.01,color: Colors.grey[500],thickness: 1),
            ),


            ///Apply For >
            Text(
              'Apply For >',
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height:  h * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.29,
                    decoration: BoxDecoration(
                        color: cartcolor7,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade600)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0,top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Image.asset('assets/images/l1.png')),
                          const Text('Tour Form',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.29,
                    decoration: BoxDecoration(
                        color: cartcolor2,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade600)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0,top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Image.asset('assets/images/l2.png')),
                          const Text('Late in/\nEarly Out',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400,fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.29,
                    decoration: BoxDecoration(
                        color: cartcolor1,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade600)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0,top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Image.asset('assets/images/l3.png')),
                          const Text('Comp Off',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:  h * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.45,
                    decoration: BoxDecoration(
                        color: cartcolor8,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade600)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0,top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Image.asset('assets/images/l4.png')),
                          const Text('Regularization',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: h * 0.11,
                    width: w * 0.45,
                    decoration: BoxDecoration(
                        color: cartcolor10,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade600)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0,top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Image.asset('assets/images/l5.png')),
                          const Text('Forgot to Punch',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400,fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
