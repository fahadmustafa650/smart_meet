import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_meet/Visitor/Appointment/search_employee_screen.dart';
import 'package:smart_meet/screens/chat_screen.dart';
import 'package:smart_meet/screens/edit_profile_screen.dart';
import 'package:smart_meet/widgets/info_panel.dart';

class VisitorProfileScreen extends StatelessWidget {
  static final id = '/visitor_profile_screen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      drawer: customDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Visitor Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 25,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        children: [
          bookAppointmentBtn(context),
          chatBtn(context),
          bookedAppointments(context),
          editProfileBtn(context),
          reportsBtn(context),
          logoutBtn(context),
        ],
      ),
    );
  }

  Widget reportsBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
          title: 'Reports',
          textIconColor: Colors.black,
          iconData: Icons.report),
    );
  }

  GestureDetector bookedAppointments(BuildContext context) {
    return GestureDetector(
      child: InfoPanel(
          title: 'Booked\nAppointments',
          textIconColor: Colors.yellow[800],
          iconData: FontAwesomeIcons.addressCard),
    );
  }

  Widget customDrawer(BuildContext context) {
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
            onTap: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
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

  Widget editProfileBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditProfileScreen.id);
      },
      child: InfoPanel(
        title: 'Edit Profile',
        textIconColor: Colors.blue,
        iconData: Icons.person,
      ),
    );
  }

  Widget chatBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.id);
      },
      child: InfoPanel(
        // bgColor: Color(0XFFA1F8AF).withOpacity(0.4),
        title: 'Chat',
        textIconColor: Colors.green[400],
        iconData: Icons.chat,
      ),
    );
  }

  Widget bookAppointmentBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EmployeeSearchBar.id);
      },
      child: InfoPanel(
        title: 'Book Appointment',
        textIconColor: Colors.yellow[900],
        iconData: Icons.approval,
      ),
    );
  }

  Widget busScheduleBtn() {
    return GestureDetector(
      onTap: () {},
      child: InfoPanel(
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
        title: 'Work pickup',
        textIconColor: Color(0XFFFFB110),
        iconData: Icons.work,
      ),
    );
  }

  Widget logoutBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => MXPSchoolPickup()));
      },
      child: InfoPanel(
        title: 'Logout',
        textIconColor: Colors.red,
        iconData: Icons.logout,
      ),
    );
  }
}
