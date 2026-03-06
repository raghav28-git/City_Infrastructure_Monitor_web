import 'package:flutter/material.dart';
import 'pages/admin/admin_dashboard.dart';

void main() => runApp(CityInfrastructureApp());

class CityInfrastructureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Infrastructure Monitor',
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAnnouncementBar(),
            _buildNavBar(context),
            _buildHeroSection(context),
            _buildTrustedSection(),
            _buildFeaturesSection(),
            _buildAnalyticsSection(),
            _buildStatsSection(),
            _buildFAQSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      color: Colors.green[700],
      child: Center(
        child: Text(
          'Live Monitoring Enabled – Smart City Infrastructure Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4)],
      ),
      child: Row(
        children: [
          Text('CityMonitor', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[700])),
          Spacer(),
          Text('Features', style: TextStyle(color: Colors.grey[700])),
          SizedBox(width: 24),
          Text('Dashboard', style: TextStyle(color: Colors.grey[700])),
          SizedBox(width: 24),
          Text('Infrastructure', style: TextStyle(color: Colors.grey[700])),
          SizedBox(width: 24),
          Text('Analytics', style: TextStyle(color: Colors.grey[700])),
          SizedBox(width: 24),
          Text('Contact', style: TextStyle(color: Colors.grey[700])),
          SizedBox(width: 32),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green[700]),
            child: Text('Login'),
          ),
          SizedBox(width: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
            child: Text('Admin Panel', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('SMART CITY SYSTEM', style: TextStyle(color: Colors.green[700], fontSize: 12, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 24),
                Text(
                  'Monitor City Infrastructure in Real Time',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                ),
                SizedBox(height: 16),
                Text(
                  'Comprehensive monitoring of traffic flow, water systems, electricity grid, and public assets with real-time analytics and predictive insights.',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MainDashboard())),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700], padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                      child: Text('View Dashboard', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                      child: Text('Explore Features', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 80),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildDashboardCard('Traffic Utilization', '78%', Colors.blue),
                _buildDashboardCard('Water Supply Capacity', '65%', Colors.cyan),
                _buildDashboardCard('Electric Grid Usage', '92%', Colors.orange),
                _buildDashboardCard('Infrastructure Health', 'Active', Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            Spacer(),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildTrustedSection() {
    return Container(
      padding: EdgeInsets.all(60),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text('Trusted by Government Organizations', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('SMART CITY COUNCIL', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400])),
              Text('URBAN PLANNING DEPT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400])),
              Text('INFRASTRUCTURE MINISTRY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      padding: EdgeInsets.all(80),
      child: Column(
        children: [
          Text('One Platform to Monitor All City Infrastructure', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.grey[800])),
          SizedBox(height: 48),
          Row(
            children: [
              Expanded(child: _buildFeatureCard('Traffic Monitoring', 'Real-time traffic flow analysis', Icons.traffic)),
              SizedBox(width: 24),
              Expanded(child: _buildFeatureCard('Water Resource Management', 'Monitor water supply and quality', Icons.water_drop)),
              SizedBox(width: 24),
              Expanded(child: _buildFeatureCard('Electricity Load Monitoring', 'Track power grid utilization', Icons.electrical_services)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(icon, size: 48, color: Colors.green[700]),
            SizedBox(height: 16),
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsSection() {
    return Container(
      padding: EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.analytics, size: 48, color: Colors.green[700]),
                    SizedBox(height: 16),
                    Text('Predict Infrastructure Load', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('AI-powered predictive analytics for infrastructure capacity planning', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.sensors, size: 48, color: Colors.green[700]),
                    SizedBox(height: 16),
                    Text('Citywide Monitoring Network', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('IoT sensors deployed across the city for comprehensive data collection', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: EdgeInsets.all(80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[800]!, Colors.green[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard('120+', 'City Zones'),
          _buildStatCard('3M+', 'Citizens'),
          _buildStatCard('500+', 'Infrastructure Assets'),
          _buildStatCard('24/7', 'Monitoring'),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Column(
      children: [
        Text(number, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 18, color: Colors.white70)),
      ],
    );
  }

  Widget _buildFAQSection() {
    return Container(
      padding: EdgeInsets.all(80),
      child: Column(
        children: [
          Text('Frequently Asked Questions', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          SizedBox(height: 48),
          _buildFAQItem('How does real-time monitoring work?', 'Our system uses IoT sensors and data analytics to provide live infrastructure status updates.'),
          _buildFAQItem('What infrastructure types are supported?', 'We monitor traffic, water systems, electricity grids, and public transportation networks.'),
          _buildFAQItem('Is the system scalable for different city sizes?', 'Yes, our platform scales from small towns to major metropolitan areas.'),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(question, style: TextStyle(fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(answer, style: TextStyle(color: Colors.grey[600])),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(60),
      color: Colors.grey[900],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CityMonitor', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 16),
                Text('Smart city infrastructure monitoring platform', style: TextStyle(color: Colors.grey[400])),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 12),
                Text('Dashboard', style: TextStyle(color: Colors.grey[400])),
                Text('Analytics', style: TextStyle(color: Colors.grey[400])),
                Text('Monitoring', style: TextStyle(color: Colors.grey[400])),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 12),
                Text('About', style: TextStyle(color: Colors.grey[400])),
                Text('Contact', style: TextStyle(color: Colors.grey[400])),
                Text('Support', style: TextStyle(color: Colors.grey[400])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
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
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
          ),
        ],
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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signIn() async {
    setState(() => _isLoading = true);
    // Simulate login delay
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;
          
          if (isMobile) {
            return _buildMobileLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(60),
            child: Center(
              child: Container(
                width: 400,
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: _buildLoginForm(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF4B4B), Color(0xFFFF6B6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_city, size: 120, color: Colors.white),
                  SizedBox(height: 24),
                  Text('Smart City Platform', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 8),
                  Text('Infrastructure Monitoring', style: TextStyle(fontSize: 18, color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF4B4B), Color(0xFFFF6B6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_city, size: 60, color: Colors.white),
                  SizedBox(height: 12),
                  Text('Smart City Platform', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: _buildLoginForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_city, size: 48, color: Color(0xFFFF4B4B)),
        SizedBox(height: 16),
        Text('Welcome Back', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Sign in to access your Smart City Dashboard', style: TextStyle(color: Colors.grey[600])),
        SizedBox(height: 32),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email address',
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF4B4B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: _isLoading 
              ? CircularProgressIndicator(color: Colors.white)
              : Text('Sign In', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        SizedBox(height: 24),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
          child: Text('Don\'t have an account? Create account', style: TextStyle(color: Color(0xFFFF4B4B))),
        ),
      ],
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    // Simulate signup delay
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;
          
          if (isMobile) {
            return _buildMobileLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(60),
            child: Center(
              child: Container(
                width: 400,
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: _buildSignUpForm(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF4B4B), Color(0xFFFF6B6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_city, size: 120, color: Colors.white),
                  SizedBox(height: 24),
                  Text('Join Smart City', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 8),
                  Text('Create your account today', style: TextStyle(fontSize: 18, color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF4B4B), Color(0xFFFF6B6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_city, size: 60, color: Colors.white),
                  SizedBox(height: 12),
                  Text('Join Smart City', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: _buildSignUpForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.person_add, size: 48, color: Color(0xFFFF4B4B)),
        SizedBox(height: 16),
        Text('Create Account', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Join the Smart City monitoring platform', style: TextStyle(color: Colors.grey[600])),
        SizedBox(height: 32),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Full Name',
            prefixIcon: Icon(Icons.person_outline),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email address',
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _confirmPasswordController,
          obscureText: !_isConfirmPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _signUp,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF4B4B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: _isLoading 
              ? CircularProgressIndicator(color: Colors.white)
              : Text('Create Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        SizedBox(height: 24),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text('Already have an account? Sign in', style: TextStyle(color: Color(0xFFFF4B4B))),
        ),
      ],
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