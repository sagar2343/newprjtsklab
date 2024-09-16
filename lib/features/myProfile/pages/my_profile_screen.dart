import 'package:flutter/material.dart';
import 'package:projects/features/widgets/custom_appbar.dart';

import '../../../config/theme/color.dart';
import '../../widgets/custom_textfield.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
          title: 'Profile',
        actions: [
          PopupMenuButton(
              iconColor: Colors.white,
              color: Colors.white,
              onSelected: (value){
                if(value == 'changePassword'){
                  //
                }
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    height: h * 0.025,
                    value: 'changePassword',
                    child: const Text('Change Password'),
                  ),
                ];
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header green portion profile
            Container(
              height: h * 0.25,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: sos2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0,bottom: 10.0),
                    child: Text('Thalappakatti Hotels Pvt LTd.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    height: h * 0.16,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.person,size: 25),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: 20.0),
                        //   child: VerticalDivider(color: Colors.black54,thickness: 0.2),
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID0434223',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                            Text('Eswara Rao Madgula',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            Text('Senior Manager HR',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        
            /// Personal Details >
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Container(
                    height: h * 0.29,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: darkdGreen,width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// personal details>
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0,bottom: 5.0),
                            child: Text('Personal Details >',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                          /// DOB
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_outlined,color: Colors.black,size: 14),
                              Text('DOB: 31 Aug 1985',style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          SizedBox(height: h * 0.01),
                          /// Gender
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.male,size: 14),
                                      Icon(Icons.female,size: 14),
                                      Text('Gender',style: TextStyle(fontSize: 16,color: Colors.grey))
                                    ],
                                  ),
                                  Text('Male',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                                ],
                              ),
                              // VerticalDivider(color: Colors.black54,thickness: 1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person_2,size: 14),
                                      Text('Maritial Status',style: TextStyle(fontSize: 16,color: Colors.grey))
                                    ],
                                  ),
                                  Text('Single',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                                ],
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey,thickness: 0.4),
                          /// Joining Date
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: [
                              Icon(Icons.person_add,size: 14),
                              Text('Joining date: 16 Mar 2021',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const Divider(color: Colors.grey,thickness: 0.4),
                          /// Location
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: [
                              Icon(Icons.location_on_outlined,size: 14),
                              Text('Location: Blr - Corporate',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        
            /// Reporting Authority >
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Container(
                    height: h * 0.19,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: darkdGreen,width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// personal details>
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0,bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Reporting Authority >',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const Text('Moinul Ashraf',style: TextStyle(fontSize: 18)),
                          SizedBox(height: h * 0.01),
                          const Text('GENERAL MANAGER HR',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          SizedBox(height: h * 0.01),
                          /// Location
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: [
                              Icon(Icons.location_on_outlined,size: 14),
                              Text('Location: Blr - Corporate',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Contact Details >
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Container(
                    height: h * 0.67,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: darkdGreen,width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0,bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Contact Details >',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          /// 1. Full Address Text Field
                          const CustomTextField(
                            label: 'Address',
                          ),
                          SizedBox(height: h * 0.02),
                          /// 2. Pincode Text Field
                          const CustomTextField(
                            label: 'Pincode',
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: h * 0.02),
                          /// 3. Address Line 2 Text Field
                          const CustomTextField(
                            label: 'Address Line 2',
                          ),
                          SizedBox(height: h * 0.02),
                          /// 4. Email Text Field
                          const CustomTextField(
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: h * 0.02),
                          /// 5. Contact Number Text Field
                          const CustomTextField(
                            label: 'Contact Number',
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height:  h * 0.03),
                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.blue
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0),
                              child: Text(
                                'UPDATE DETAILS',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
