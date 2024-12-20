import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/providers/card_notifier.dart';
import 'package:securitymanagementsystem/widgets/cards.dart';
import 'package:securitymanagementsystem/widgets/headings.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    ComplaintsScreen(),
    ContactScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.comment, 1),
            label: 'My Complaints',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.contact_page, 2),
            label: 'Contact',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return _currentIndex == index
        ? CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: Icon(icon, color: Colors.blue, size: 30),
          )
        : Icon(
            icon,
            size: 24,
            color: Colors.grey,
          );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/main.png',
              height: screenHeight * 0.07,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              'Transworld Home',
              style: TextStyle(fontSize: screenWidth * 0.035),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xFFE2F0FB),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Color(0xFF1664B2),
                size: screenWidth * 0.07,
              ),
              onPressed: () {},
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFF1664B2),
            size: screenWidth * 0.07,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome to your',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                      Text('Security System',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05,
                              color: Color(0xFF1664B2))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person),
                        backgroundColor: Color(0xFF1664B2),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              headings().h3('Ahmad'),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                "Active",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ],
                          ),
                          Text(
                            'ID: 92',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: screenHeight * 0.02,
                crossAxisSpacing: screenWidth * 0.04,
                childAspectRatio: screenWidth / (screenHeight / 2.5),
                children: [
                  ChangeNotifierProvider(
                    create: (_) => CardNotifier()
                      ..setTitle('My Plans')
                      ..setIcon(Icons.assignment),
                    child: const CustomCard(),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => CardNotifier()
                      ..setTitle('My Bills')
                      ..setIcon(Icons.receipt),
                    child: const CustomCard(),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => CardNotifier()
                      ..setTitle('My Tax Certificate')
                      ..setIcon(Icons.insert_drive_file),
                    child: const CustomCard(),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => CardNotifier()
                      ..setTitle('My Services')
                      ..setIcon(Icons.support_agent),
                    child: const CustomCard(),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Transaction History',
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1664B2)),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _buildTransactionItem(
                  'Fund Transfer', 'Oct 21, 2021', 'Rs 2,345', screenWidth),
              _buildTransactionItem(
                  'Online Payment', 'Oct 21, 2021', 'Rs 2,345', screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
      String title, String date, String amount, double screenWidth) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.send, color: Colors.green),
        backgroundColor: Color(0xFFD5EAD3),
        radius: screenWidth * 0.07,
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing:
          Text(amount, style: TextStyle(color: Colors.green, fontSize: 14)),
    );
  }
}

class ComplaintsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Complaints'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'My Complaints Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Contact Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
