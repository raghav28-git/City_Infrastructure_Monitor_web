enum AssetType { road, bridge, tunnel, powerGrid, waterSystem, publicTransport }

enum UtilizationStatus { underused, normal, congested, overloaded }

class InfrastructureAsset {
  final String id;
  final String name;
  final AssetType type;
  final double capacity;
  final double currentUsage;
  final String location;

  InfrastructureAsset({
    required this.id,
    required this.name,
    required this.type,
    required this.capacity,
    required this.currentUsage,
    required this.location,
  });

  double get utilizationPercentage => (currentUsage / capacity * 100).clamp(0, 150);

  UtilizationStatus get status {
    final percentage = utilizationPercentage;
    if (percentage < 30) return UtilizationStatus.underused;
    if (percentage < 80) return UtilizationStatus.normal;
    if (percentage < 100) return UtilizationStatus.congested;
    return UtilizationStatus.overloaded;
  }

  String get statusText {
    switch (status) {
      case UtilizationStatus.underused: return 'Underused';
      case UtilizationStatus.normal: return 'Normal';
      case UtilizationStatus.congested: return 'Congested';
      case UtilizationStatus.overloaded: return 'Overloaded';
    }
  }
}