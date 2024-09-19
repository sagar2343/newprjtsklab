import 'package:flutter/material.dart';
import 'package:projects/features/myProfile/data/myprofile_data.dart';
import 'package:projects/features/widgets/custom_appbar.dart';
import '../../../config/theme/color.dart';
import '../../widgets/custom_textfield.dart';
import '../data/response/myprofile_response_model.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  TextEditingController _addController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  TextEditingController _teleController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  late Future<EmployeeResponse> _employeeFuture;
  final MyProfileApiCall _myProfileApiCall = MyProfileApiCall();

  @override
  void initState() {
    super.initState();
    _employeeFuture = _myProfileApiCall.fetchEmployeeDetails('01', 'D027673'); // Pass required params here
    print(_employeeFuture);
  }


  @override
  void dispose() {
    _addController.dispose();
    _pinController.dispose();
    _teleController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    super.dispose();
  }

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
      body:FutureBuilder<EmployeeResponse>(
        future: _employeeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          final employee = snapshot.data!;
          _addController.text = employee.proPubEmployeeContact!.first.proPubStrPresentAdd.toString();
          _pinController.text = employee.proPubEmployeeContact!.first.proPubStrPrPinCode.toString();
          _teleController.text = employee.proPubEmployeeContact!.first.proPubStrPrTelephoneNo.toString();
          _emailController.text = employee.proPubEmployeeContact!.first.proPubStrEmailPersonal.toString();
          _contactController.text = employee.proPubEmployeeContact!.first.proPubStrEmpMobile.toString();


          return SingleChildScrollView(
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
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0,bottom: 10.0),
                        child: Text("${employee.proPubEmployeeDetails!.first.proPubStrCompanyName}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Padding(
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
                                Text('${employee.proPubEmployeeDetails!.first.proPubStrEmpcd}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                                Text('${employee.proPubEmployeeDetails!.first.proPubStrFullName}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                                Text('${employee.proPubEmployeeDetails!.first.proPubStrDesignation}',style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.calendar_today_outlined,color: Colors.black,size: 14),
                                  Text('DOB: ${employee.proPubEmployeeDetails!.first.proPubStrBirthDt}',style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                              SizedBox(height: h * 0.01),
                              /// Gender
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.male,size: 14),
                                          Icon(Icons.female,size: 14),
                                          Text('Gender',style: TextStyle(fontSize: 16,color: Colors.grey))
                                        ],
                                      ),
                                      Text("${employee.proPubEmployeeDetails!.first.proPubStrGender}",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  // VerticalDivider(color: Colors.black54,thickness: 1),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.person_2,size: 14),
                                          Text('Maritial Status',style: TextStyle(fontSize: 16,color: Colors.grey))
                                        ],
                                      ),
                                      Text('${employee.proPubEmployeeDetails!.first.proPubStrMaritalStatus}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.grey,thickness: 0.4),
                              /// Joining Date
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center ,
                                children: [
                                  const Icon(Icons.person_add,size: 14),
                                  Text('Joining date: ${employee.proPubEmployeeDetails!.first.proPubStrJoinDt}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                ],
                              ),
                              const Divider(color: Colors.grey,thickness: 0.4),
                              /// Location
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center ,
                                children: [
                                  const Icon(Icons.location_on_outlined,size: 14),
                                  Text('Location: ${employee.proPubEmployeeDetails!.first.proPubStrLocation}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                              Text('${employee.proPubEmployeeReporting!.first.proPubStrAName}',style: const TextStyle(fontSize: 18)),
                              SizedBox(height: h * 0.01),
                              Text('${employee.proPubEmployeeReporting!.first.proPubStrADesgination}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              SizedBox(height: h * 0.01),
                              /// Location
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center ,
                                children: [
                                  const Icon(Icons.location_on_outlined,size: 14),
                                  Text('Location: ${employee.proPubEmployeeReporting!.first.proPubStrALocation}',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                              CustomTextField(
                                controller: _addController,
                                label: 'Address',
                              ),
                              SizedBox(height: h * 0.02),
                              /// 2. Pincode Text Field
                              CustomTextField(
                                controller: _pinController,
                                label: 'Pincode',
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: h * 0.02),
                              /// 3. Telephone No. Text Field
                              CustomTextField(
                                controller: _teleController,
                                label: 'Telephone No.',
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: h * 0.02),
                              /// 4. Email Text Field
                              CustomTextField(
                                controller: _emailController,
                                label: 'Email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: h * 0.02),
                              /// 5. Contact Number Text Field
                              CustomTextField(
                                controller: _contactController,
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
          );
        },
      )


    );
  }
}
