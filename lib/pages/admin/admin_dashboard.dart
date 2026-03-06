import 'package:flutter/material.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_app_bar.dart';
import '../../widgets/kpi_card.dart';
import '../../widgets/infrastructure_card.dart';
import '../../widgets/alert_card.dart';
import '../../widgets/chart_widget.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String currentPage = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const TopAppBar(),
      body: Row(
        children: [
          Sidebar(
            currentPage: currentPage,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(),
          const SizedBox(height: 24),
          _buildKpiSection(),
          const SizedBox(height: 32),
          _buildInfrastructureSection(),
          const SizedBox(height: 32),
          _buildChartsSection(),
          const SizedBox(height: 32),
          _buildAlertsSection(),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Smart City Dashboard',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Monitor and manage city infrastructure capacity & utilization in real-time',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildKpiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Performance Indicators',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            KpiCard(
              title: 'Total Infrastructure',
              value: '1,247',
              trend: '+12%',
              icon: Icons.apartment,
              color: const Color(0xFF4F46E5),
              isPositiveTrend: true,
            ),
            KpiCard(
              title: 'Overloaded Resources',
              value: '23',
              trend: '-8%',
              icon: Icons.warning,
              color: Colors.red[500]!,
              isPositiveTrend: false,
            ),
            KpiCard(
              title: 'Underused Resources',
              value: '156',
              trend: '+5%',
              icon: Icons.trending_down,
              color: Colors.blue[500]!,
              isPositiveTrend: true,
            ),
            KpiCard(
              title: 'Active Alerts',
              value: '7',
              trend: '-15%',
              icon: Icons.notifications,
              color: Colors.orange[500]!,
              isPositiveTrend: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfrastructureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Infrastructure Monitoring',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
          children: [
            InfrastructureCard(
              title: 'Traffic Monitoring',
              capacity: 5000,
              currentUsage: 4200,
              icon: Icons.traffic,
              status: 'High',
            ),
            InfrastructureCard(
              title: 'Parking Usage',
              capacity: 2500,
              currentUsage: 1800,
              icon: Icons.local_parking,
              status: 'Normal',
            ),
            InfrastructureCard(
              title: 'Waste Management',
              capacity: 800,
              currentUsage: 720,
              icon: Icons.delete,
              status: 'High',
            ),
            InfrastructureCard(
              title: 'Water Supply',
              capacity: 10000,
              currentUsage: 7500,
              icon: Icons.water_drop,
              status: 'Normal',
            ),
            InfrastructureCard(
              title: 'Public Transport',
              capacity: 1500,
              currentUsage: 450,
              icon: Icons.directions_bus,
              status: 'Underused',
            ),
            InfrastructureCard(
              title: 'Energy Grid',
              capacity: 8000,
              currentUsage: 7200,
              icon: Icons.electrical_services,
              status: 'High',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChartsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Analytics Overview',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ChartWidget(
                title: 'Infrastructure Types Distribution',
                chartType: 'Pie',
                height: 300,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ChartWidget(
                title: 'Utilization by Zone',
                chartType: 'Bar',
                height: 300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ChartWidget(
          title: 'Usage Trend Over Time',
          chartType: 'Line',
          height: 250,
        ),
      ],
    );
  }

  Widget _buildAlertsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Alerts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              AlertCard(
                title: 'Traffic congestion detected',
                location: 'Downtown District',
                timestamp: '2 min ago',
                severity: 'High',
                icon: Icons.traffic,
              ),
              AlertCard(
                title: 'Waste bin overflow alert',
                location: 'Park Avenue',
                timestamp: '15 min ago',
                severity: 'Medium',
                icon: Icons.delete,
              ),
              AlertCard(
                title: 'Parking underutilized',
                location: 'Shopping Mall',
                timestamp: '1 hour ago',
                severity: 'Low',
                icon: Icons.local_parking,
              ),
              AlertCard(
                title: 'Water pressure drop',
                location: 'Residential Zone B',
                timestamp: '2 hours ago',
                severity: 'Critical',
                icon: Icons.water_drop,
              ),
            ],
          ),
        ),
      ],
    );
  }
}