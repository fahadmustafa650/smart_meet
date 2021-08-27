import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_meet/Visitor/Appointment/search_employee_screen.dart';
import 'package:smart_meet/Visitor/Visitor%20Authentication/visitor_sign_in_screen.dart';
import 'package:smart_meet/providers/visitor_provider.dart';
import 'package:smart_meet/screens/chat_screen.dart';
import 'package:smart_meet/screens/edit_profile_screen.dart';
import 'package:smart_meet/widgets/info_panel.dart';
import 'Appointment/search_result_screen - Copy.dart';
import 'Visitor Verification Steps/booked_appointment_qrcode.dart';

class VisitorHomeScreen extends StatefulWidget {
  static final id = '/visitor_home_screen';

  @override
  _VisitorHomeScreenState createState() => _VisitorHomeScreenState();
}

class _VisitorHomeScreenState extends State<VisitorHomeScreen> {
  bool _isInit;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _isInit = true;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      //await Provider.of<Visitors>(context).getVisitorData(args['email']);
      setState(() {
        _isLoading = true;
      });
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      await Provider.of<Visitors>(context).getVisitorData(args['email']);
    }
    setState(() {
      _isInit = false;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final visitorData = Provider.of<Visitors>(context).getVisitor;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      drawer: !_isLoading
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountEmail: visitorData.email == null
                        ? CircularProgressIndicator()
                        : Text(visitorData.email),
                    accountName: visitorData.firstName == null ||
                            visitorData.lastName == null
                        ? CircularProgressIndicator()
                        : Text(
                            '${visitorData.firstName} ${visitorData.lastName}'),
                    currentAccountPicture: _isLoading
                        ? CircularProgressIndicator()
                        : CircleAvatar(
                            radius: 100,
                            backgroundImage: _isLoading
                                ? AssetImage('assets/images/blank_pic.jpg')
                                : NetworkImage(visitorData.imageUrl),
                          ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Edit Profile"),
                    onTap: () {
                      Navigator.pushNamed(context, EditProfileScreen.id);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Book Appointment"),
                    onTap: () {
                      // print("Categories Clicked");
                      Navigator.pushNamed(context, BookedAppointmentsScreen.id);
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
            )
          : Container(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: _isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : Text(
                ('${visitorData.firstName} ${visitorData.lastName}'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 25,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EmployeeSearchBar.id);
            },
            child: InfoPanel(
              title: 'Book Appointment',
              textIconColor: Colors.yellow[900],
              iconData: Icons.approval,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
            child: InfoPanel(
              // bgColor: Color(0XFFA1F8AF).withOpacity(0.4),
              title: 'Chat',
              textIconColor: Colors.green[400],
              iconData: Icons.chat,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, BookedAppointmentsScreen.id);
            },
            child: InfoPanel(
                title: 'Booked\nAppointments',
                textIconColor: Colors.yellow[800],
                iconData: FontAwesomeIcons.addressCard),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EditProfileScreen.id);
            },
            child: InfoPanel(
              title: 'Edit Profile',
              textIconColor: Colors.blue,
              iconData: Icons.person,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: InfoPanel(
                title: 'Reports',
                textIconColor: Colors.black,
                iconData: Icons.report),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MXPSchoolPickup()));
              clearLoginData();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VisitorSignInScreen()));
            },
            child: InfoPanel(
              title: 'Logout',
              textIconColor: Colors.red,
              iconData: Icons.logout,
            ),
          )
        ],
      ),
    );
  }

  void clearLoginData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
