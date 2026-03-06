import 'package:flutter/material.dart';
import '../admin/admin_dashboard.dart';
import '../authority/authority_dashboard.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Infrastructure Login'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_city, size: 100, color: Colors.blue),
            SizedBox(height: 32),
            Text('Select User Type', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            _buildRoleButton(context, 'Admin', Icons.admin_panel_settings, Colors.red, AdminDashboard()),
            SizedBox(height: 16),
            _buildRoleButton(context, 'Authority', Icons.security, Colors.orange, AuthorityDashboard()),
            SizedBox(height: 16),
            _buildRoleButton(context, 'Public View', Icons.visibility, Colors.green, null),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String role, IconData icon, Color color, Widget? page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(200, 60),
      ),
      onPressed: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        } else {
          Navigator.pop(context);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(role, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}