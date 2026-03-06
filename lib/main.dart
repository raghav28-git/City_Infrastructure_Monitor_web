import 'package:flutter/material.dart';

void main() => runApp(CityInfrastructureApp());

class CityInfrastructureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Infrastructure Monitor',
      home: MonitoringDashboard(),
    );
  }
}

class MonitoringDashboard extends StatefulWidget {
  @override
  _MonitoringDashboardState createState() => _MonitoringDashboardState();
}

class _MonitoringDashboardState extends State<MonitoringDashboard> {
  List<Asset> assets = [
    Asset('Main Highway', 5000, 3200, 'Downtown'),
    Asset('Central Bridge', 2000, 2100, 'River District'),
    Asset('Metro Line A', 8000, 1800, 'City Center'),
    Asset('Power Grid Zone 1', 1000, 850, 'North District'),
    Asset('Water Treatment Plant', 50000, 42000, 'East Side'),
    Asset('Underground Tunnel', 1500, 1600, 'West End'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Infrastructure Monitor'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          final asset = assets[index];
          final percentage = (asset.usage / asset.capacity * 100).clamp(0, 150);
          Color color = Colors.green;
          String status = 'Normal';
          
          if (percentage < 30) {
            color = Colors.blue;
            status = 'Underused';
          } else if (percentage >= 80 && percentage < 100) {
            color = Colors.orange;
            status = 'Congested';
          } else if (percentage >= 100) {
            color = Colors.red;
            status = 'Overloaded';
          }

          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_city, color: color),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(asset.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(status, style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(asset.location, style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: (percentage / 100).clamp(0.0, 1.0),
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${asset.usage.toInt()} / ${asset.capacity.toInt()}'),
                      Text('${percentage.toStringAsFixed(1)}%', 
                           style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Asset {
  final String name;
  final double capacity;
  final double usage;
  final String location;

  Asset(this.name, this.capacity, this.usage, this.location);
}
