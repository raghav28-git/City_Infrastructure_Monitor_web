class Infrastructure {
  final String id;
  final String name;
  final InfrastructureType type;
  final String zone;
  final int capacity;
  final int currentUsage;
  final double latitude;
  final double longitude;
  final String? description;

  Infrastructure({
    required this.id,
    required this.name,
    required this.type,
    required this.zone,
    required this.capacity,
    required this.currentUsage,
    required this.latitude,
    required this.longitude,
    this.description,
  });

  double get utilizationPercentage => (currentUsage / capacity) * 100;

  InfrastructureStatus get status {
    final utilization = utilizationPercentage;
    if (utilization >= 100) return InfrastructureStatus.overload;
    if (utilization >= 80) return InfrastructureStatus.highUsage;
    if (utilization <= 30) return InfrastructureStatus.underused;
    return InfrastructureStatus.normal;
  }
}

enum InfrastructureType {
  traffic,
  parking,
  waste,
  water,
  transport,
}

enum InfrastructureStatus {
  normal,
  highUsage,
  overload,
  underused,
}

extension InfrastructureTypeExtension on InfrastructureType {
  String get displayName {
    switch (this) {
      case InfrastructureType.traffic:
        return 'Traffic';
      case InfrastructureType.parking:
        return 'Parking';
      case InfrastructureType.waste:
        return 'Waste';
      case InfrastructureType.water:
        return 'Water';
      case InfrastructureType.transport:
        return 'Transport';
    }
  }
}

extension InfrastructureStatusExtension on InfrastructureStatus {
  String get displayName {
    switch (this) {
      case InfrastructureStatus.normal:
        return 'Normal';
      case InfrastructureStatus.highUsage:
        return 'High Usage';
      case InfrastructureStatus.overload:
        return 'Overload';
      case InfrastructureStatus.underused:
        return 'Underused';
    }
  }
}