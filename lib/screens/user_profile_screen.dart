import 'package:flutter/material.dart';
import 'package:smart_meet/widgets/info_panel.dart';

class UserProfile extends StatelessWidget {
  static final id = '/user_profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      drawer: customDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'User Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          // workPickupBtn(),
          // busScheduleBtn(),
          bookAppointmentBtn(),
          chatBtn(),
          editProfileBtn(),
          logoutBtn(),
        ],
      ),
    );
  }

  Drawer customDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("fahadkhan123@email.com"),
            accountName: Text("Fahad Mustafa"),
            currentAccountPicture: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Book Appointment"),
            onTap: () {
              // print("Categories Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.add_to_photos),
            title: Text("Reports"),
            onTap: () {
              //print("Add Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Chat"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(""),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text(""),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget editProfileBtn() {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
        bgColor: Color(0XFFEEF7FE),
        title: 'Edit Profile',
        textIconColor: Color(0XFF415EB6),
        iconData: Icons.person,
      ),
    );
  }

  Widget chatBtn() {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
        bgColor: Color(0XFFA1F8AF).withOpacity(0.4),
        title: 'Chat',
        textIconColor: Color(0XFF4CE364),
        iconData: Icons.chat,
      ),
    );
  }

  Widget bookAppointmentBtn() {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
        bgColor: Color(0XFFF0FFFF),
        title: 'Book Appointment',
        textIconColor: Color(0XFF23B0B0),
        iconData: Icons.approval,
      ),
    );
  }

  Widget busScheduleBtn() {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
        bgColor: Color(0XFFFEEEEE),
        title: '',
        textIconColor: Color(0XFFAC4141),
        iconData: Icons.bus_alert,
      ),
    );
  }

  Widget workPickupBtn() {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
        bgColor: Color(0XFFFFFBEC),
        title: 'Work pickup',
        textIconColor: Color(0XFFFFB110),
        iconData: Icons.work,
      ),
    );
  }

  Widget logoutBtn() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => MXPSchoolPickup()));
      },
      child: InfoPanel(
        bgColor: Color(0XFFEEF7FE),
        title: 'Logout',
        textIconColor: Color(0XFF415EB6),
        iconData: Icons.logout,
      ),
    );
  }
}
