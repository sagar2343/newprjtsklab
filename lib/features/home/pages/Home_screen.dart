import 'package:flutter/material.dart';
import 'package:projects/features/holidayList/pages/holidaylist_screen.dart';
import 'package:projects/features/home/controller/home_grid_controller.dart';
import 'package:projects/features/leave/pages/leave_home_screen.dart';
import 'package:projects/features/myProfile/pages/my_profile_screen.dart';
import 'package:projects/features/widgets/custom_appbar.dart';

import '../data/home_grid_data.dart';
import '../data/response/home_grid_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController _homeController = HomeController();
  late Future<HomeGridModuleResponse> _moduleResponse;

  @override
  void initState() {
    super.initState();
    // Fetch modules when the screen is initialized
    _moduleResponse = HomeGridApiCall().fetchModules();
  }


  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Good Afternoon',
        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            color: Colors.white,
            onSelected: (value){
              if(value == 'notification'){
                //
              } else if(value == 'myProfile'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyProfileScreen()));
              }else if(value == 'logout'){
                //
              }
            },
              itemBuilder: (BuildContext context){
                return [
                  const PopupMenuItem(
                    value: 'notification',
                      child: Text('Notification'),
                  ),
                  const PopupMenuItem(
                    value: 'myProfile',
                    child: Text('My profile'),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ];
              }
          )
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          )]
        ),
          child: const Icon(Icons.chat_bubble,color: Colors.yellow),
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Blue container
              Container(
                width: double.infinity,
                height: h * 0.27,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: h * 0.025),
                    const Text('Thalappakatti hotels pvt ltd',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    SizedBox(height: h * 0.015),
                    const Text('Eswara Rao Madugula',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    SizedBox(height: h * 0.01),
                    const Text(
                      'Senior Manager HR',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Positioned CircleAvatar
              Positioned(
                top: h * 0.27 - 50, // Place half on the container, half below
                right: w * 0.35,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white70,
                  child: Icon(Icons.person,size: 70),
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.06),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<HomeGridModuleResponse>(
                future: _moduleResponse,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final activeModules = snapshot.data!.modules
                        .where((module) => module.isActive == '1')
                        .toList();

                    if (activeModules.isEmpty) {
                      return const Center(child: Text('No modules available'));
                    }

                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: activeModules.length,
                      itemBuilder: (context, index) {
                        final item = activeModules[index];
                        return GestureDetector(
                          onTap: () {
                            // Handle item tap
                            _homeController.navigateToGridModule(context, item.moduleName);
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/homeGrid/${item.moduleName.toLowerCase().replaceAll(" ", "_")}.png',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Center(
                                    child: Text(
                                      item.moduleName,
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    // Handle the case where snapshot has no data
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: const Center(child: Text('This is Page 3')),
    );
  }
}


class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 5')),
      body: const Center(child: Text('This is Page 5')),
    );
  }
}