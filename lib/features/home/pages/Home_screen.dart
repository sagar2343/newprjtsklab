import 'package:flutter/material.dart';
import 'package:projects/features/holidayList/pages/holidaylist_screen.dart';
import 'package:projects/features/leave/pages/leave_home_screen.dart';
import 'package:projects/features/widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> gridItems = [
    {'name':'ATTENDANCE', 'image':'assets/images/clip1.png', 'page': const Page1()},
    {'name':'LEAVE', 'image':'assets/images/clip2.png', 'page': const LeaveHomeScreen()},
    {'name':'OR PUNCH', 'image':'assets/images/clip3.png', 'page': const Page3()},
    {'name':'HOLIDAY LIST', 'image':'assets/images/clip4.png', 'page': const HolidayListScreen()},
    {'name':'WEBSITE', 'image':'assets/images/clip5.png', 'page': const Page5()},
    {'name':'DOWNLOAD', 'image':'assets/images/clip6.png', 'page': const Page5()},
    {'name':'GEO FENCING', 'image':'assets/images/clip7.png', 'page': const Page5()},
  ];


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
                //
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
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index){
                    final item = gridItems[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => item['page']));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(item['image']!)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Center(
                                child: Text(
                                  item['name']!,
                                  style: const TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}




// Sample pages for demonstration
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: const Center(child: Text('This is Page 1')),
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