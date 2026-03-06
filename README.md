# 🏙️ City Infrastructure Monitor

A comprehensive **Smart City Management Platform** built with Flutter for real-time monitoring and optimization of urban infrastructure resources.

![Flutter](https://img.shields.io/badge/Flutter-3.11.0-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Mobile%20%7C%20Desktop-brightgreen)

## 📋 Overview

City Infrastructure Monitor is an intelligent platform that enables city administrators and authorities to monitor, analyze, and optimize infrastructure capacity and utilization in real-time. The system tracks multiple infrastructure types including traffic, water supply, energy grids, parking, waste management, and public transport.

### 🎯 Problem Statement

Cities face critical challenges with infrastructure management:
- **23 overloaded resources** causing congestion and service disruption
- **156 underutilized resources** leading to wasted capacity
- Lack of real-time visibility into infrastructure status
- Delayed response to critical alerts
- Inefficient resource allocation

### 💡 Solution

A unified monitoring platform that provides:
- Real-time tracking of **1,247+ infrastructure assets**
- Intelligent alert system with severity-based notifications
- Predictive analytics for capacity planning
- Multi-role dashboards (Admin, Authority, Public)
- Visual analytics with interactive charts

## ✨ Key Features

### 🎛️ Real-Time Dashboard
- **Live KPI Tracking**: Monitor total infrastructure, overloaded resources, underused resources, and active alerts
- **Visual Status Indicators**: Color-coded system (🔵 Underused, 🟢 Normal, 🟠 High, 🔴 Overload)
- **Trend Analysis**: Track performance changes with percentage indicators
- **Animated Widgets**: Smooth transitions and hover effects for better UX

### 🏗️ Infrastructure Monitoring
Monitor 6 critical infrastructure types:
1. **Traffic Monitoring** - Real-time traffic flow and congestion detection
2. **Parking Usage** - Parking lot capacity and utilization tracking
3. **Waste Management** - Waste bin levels and collection optimization
4. **Water Supply** - Water distribution and pressure monitoring
5. **Public Transport** - Bus/metro capacity and ridership tracking
6. **Energy Grid** - Electricity load and distribution monitoring

### 🚨 Smart Alert System
- **Multi-Level Alerts**: Critical, Warning, and Info severity levels
- **Location-Based**: Pinpoint exact location of infrastructure issues
- **Real-Time Notifications**: Instant alerts with timestamps
- **Alert History**: Track and analyze past incidents

### 📊 Analytics & Insights
- **Infrastructure Distribution**: Pie charts showing asset type breakdown
- **Zone Utilization**: Bar charts comparing different city zones
- **Usage Trends**: Line graphs tracking utilization over time
- **Predictive Analytics**: AI-powered capacity planning recommendations

### 👥 Multi-Role Access
- **Admin Dashboard**: Full system control and configuration
- **Authority Dashboard**: Zone-specific monitoring and management
- **Public View**: Transparent citizen access to infrastructure status

## 🛠️ Technology Stack

- **Framework**: Flutter 3.11.0
- **Language**: Dart 3.0+
- **UI Design**: Material Design 3
- **Architecture**: Modular component-based architecture
- **State Management**: StatefulWidget with setState
- **Animations**: Custom AnimationController with curves
- **Responsive**: Adaptive layouts for mobile, tablet, and desktop

## 📁 Project Structure

```
city_infrastructure_monitor/
├── lib/
│   ├── main.dart                          # App entry point & landing page
│   ├── models/
│   │   └── infrastructure_asset.dart      # Data models
│   ├── pages/
│   │   ├── admin/
│   │   │   ├── admin_dashboard.dart       # Main admin dashboard
│   │   │   ├── alerts_management.dart     # Alert management page
│   │   │   ├── analytics.dart             # Analytics page
│   │   │   ├── infrastructure_management.dart
│   │   │   └── map_monitoring.dart        # Map view
│   │   ├── authority/
│   │   │   └── authority_dashboard.dart   # Authority role dashboard
│   │   └── common/
│   │       └── login_page.dart            # Authentication page
│   ├── services/
│   │   └── infrastructure_service.dart    # Business logic
│   └── widgets/
│       ├── alert_card.dart                # Alert display widget
│       ├── asset_card.dart                # Asset card widget
│       ├── chart_widget.dart              # Chart components
│       ├── infrastructure_card.dart       # Infrastructure monitoring card
│       ├── kpi_card.dart                  # KPI display card
│       ├── sidebar.dart                   # Navigation sidebar
│       └── top_app_bar.dart               # Top app bar
├── assets/
│   └── login page.jpeg
├── pubspec.yaml
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.11.0 or higher
- Dart SDK 3.0 or higher
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/city_infrastructure_monitor.git
   cd city_infrastructure_monitor
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For web
   flutter run -d chrome

   # For desktop (Windows)
   flutter run -d windows

   # For mobile
   flutter run
   ```

### Build for Production

```bash
# Web
flutter build web

# Windows
flutter build windows

# Android
flutter build apk

# iOS
flutter build ios
```

## 📱 Usage

### Landing Page
- View live infrastructure statistics
- Explore features and capabilities
- Access login for different user roles

### Admin Dashboard
1. **Monitor KPIs**: View total infrastructure, overloaded/underused resources, and active alerts
2. **Track Infrastructure**: Real-time monitoring of all 6 infrastructure types
3. **Analyze Trends**: Interactive charts showing distribution and utilization
4. **Manage Alerts**: Review and respond to critical infrastructure alerts

### Authority Dashboard
- Zone-specific monitoring
- Maintenance tracking
- Alert summaries for assigned areas

## 🎨 UI Components

### KPI Card
- Animated entry with scale and fade effects
- Hover interactions with elevation changes
- Trend indicators with color coding
- Icon-based visual representation

### Infrastructure Card
- Real-time capacity vs. usage display
- Animated progress bars
- Status-based color coding
- Utilization percentage calculation

### Alert Card
- Severity-based styling
- Location and timestamp information
- Icon representation of alert type
- Quick action buttons

## 📊 Key Metrics

- **Total Infrastructure Assets**: 1,247
- **Overloaded Resources**: 23 (-8% trend)
- **Underused Resources**: 156 (+5% trend)
- **Active Alerts**: 7 (-15% trend)
- **City Zones Monitored**: 120+
- **Citizens Served**: 3M+
- **Uptime**: 24/7 monitoring

## 🔮 Future Roadmap

### Phase 1 (Current) ✅
- Core monitoring dashboard
- Alert management system
- Basic analytics and reporting

### Phase 2 (Next 3 Months)
- [ ] IoT sensor integration
- [ ] Mobile app deployment (Android/iOS)
- [ ] Machine learning predictions
- [ ] Real-time data streaming

### Phase 3 (6 Months)
- [ ] Citizen mobile app
- [ ] REST API for third-party integration
- [ ] Advanced AI recommendations
- [ ] Multi-language support

### Phase 4 (1 Year)
- [ ] Multi-city deployment
- [ ] Blockchain for data integrity
- [ ] AR visualization for field teams
- [ ] Voice-activated controls

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Project Lead**: [Your Name]
- **Developers**: [Team Members]
- **UI/UX Designer**: [Designer Name]

## 📧 Contact

- **Email**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)
- **LinkedIn**: [Your LinkedIn](https://linkedin.com/in/yourprofile)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI guidelines
- Smart City initiatives worldwide for inspiration

## 📸 Screenshots

### Landing Page
![Landing Page](screenshots/landing.png)

### Admin Dashboard
![Admin Dashboard](screenshots/admin-dashboard.png)

### Infrastructure Monitoring
![Infrastructure Monitoring](screenshots/infrastructure.png)

### Analytics
![Analytics](screenshots/analytics.png)

---

**Built with ❤️ using Flutter for Smarter Cities**

⭐ Star this repository if you find it helpful!
