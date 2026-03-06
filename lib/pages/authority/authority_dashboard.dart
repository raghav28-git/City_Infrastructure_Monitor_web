import 'package:flutter/material.dart';

class AuthorityDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authority Dashboard'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                _buildStatusCard('Active Alerts', '3', Colors.red),
                _buildStatusCard('Zones Monitored', '12', Colors.blue),
                _buildStatusCard('Maintenance Due', '5', Colors.orange),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildZoneCard('North District', 'Power Grid', 85, Colors.orange),
                _buildZoneCard('Downtown', 'Traffic System', 95, Colors.red),
                _buildZoneCard('East Side', 'Water System', 75, Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
              Text(title, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZoneCard(String zone, String type, int utilization, Color color) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color, child: Text('$utilization%')),
        title: Text(zone),
        subtitle: Text(type),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}