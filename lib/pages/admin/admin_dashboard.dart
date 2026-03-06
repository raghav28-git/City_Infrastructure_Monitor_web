import 'package:flutter/material.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_app_bar.dart';
import '../../widgets/kpi_card.dart';
import '../../widgets/infrastructure_card.dart';
import '../../widgets/alert_card.dart';
import '../../widgets/chart_widget.dart';
import 'alerts_management.dart';
import 'analytics.dart';
import 'map_monitoring.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> with TickerProviderStateMixin {
  String currentPage = 'Dashboard';
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Row(
        children: [
          Sidebar(
            currentPage: currentPage,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
                _fadeController.reset();
                _fadeController.forward();
              });
            },
          ),
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _buildPageContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent() {
    switch (currentPage) {
      case 'Infrastructure':
        return _buildInfrastructureContent();
      case 'Alerts':
        return AlertsManagementContent();
      case 'Analytics':
        return AnalyticsContent();
      case 'Settings':
        return _buildSettingsContent();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
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

  Widget _buildInfrastructureContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2C2C2C),
                  Color(0xFF121212),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF2C2C2C),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2563EB).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.apartment, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Infrastructure Management',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF9FAFB),
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Monitor and manage all city infrastructure resources',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE5E4E2),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildInfrastructureSection(),
        ],
      ),
    );
  }

  Widget _buildSettingsContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            'Settings page coming soon',
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C2C2C),
            Color(0xFF121212),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Color(0xFF2C2C2C),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6366F1).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.dashboard, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Smart City Dashboard',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF9FAFB),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Monitor and manage city infrastructure in real-time',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFE5E4E2),
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKpiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Performance Indicators',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF9FAFB),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildAnimatedKpiCard('Total Infrastructure', '1,247', '+12%', Icons.apartment, const Color(0xFF2563EB), true, 0),
            _buildAnimatedKpiCard('Overloaded Resources', '23', '-8%', Icons.warning, const Color(0xFFEF4444), false, 100),
            _buildAnimatedKpiCard('Underused Resources', '156', '+5%', Icons.trending_down, const Color(0xFF3B82F6), true, 200),
            _buildAnimatedKpiCard('Active Alerts', '7', '-15%', Icons.notifications, const Color(0xFFF59E0B), false, 300),
          ],
        ),
      ],
    );
  }

  Widget _buildAnimatedKpiCard(String title, String value, String trend, IconData icon, Color color, bool isPositive, int delay) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800 + delay),
      curve: Curves.easeOutCubic,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double val, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - val)),
          child: Opacity(
            opacity: val,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2C2C2C),
                      Color(0xFF121212),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: color.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color, color.withOpacity(0.6)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.5),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(icon, color: Colors.white, size: 20),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: (isPositive ? Colors.green : Colors.red).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: (isPositive ? Colors.green : Colors.red).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            trend,
                            style: TextStyle(
                              color: isPositive ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF9FAFB),
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFE5E4E2),
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfrastructureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Infrastructure Monitoring',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF9FAFB),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
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