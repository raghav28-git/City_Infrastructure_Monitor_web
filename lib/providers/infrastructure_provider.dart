import 'package:flutter/foundation.dart';
import '../models/infrastructure.dart';

class InfrastructureProvider extends ChangeNotifier {
  List<Infrastructure> _infrastructures = [
    Infrastructure(
      id: '1',
      name: 'Main Highway Bridge',
      type: InfrastructureType.traffic,
      zone: 'Downtown',
      capacity: 5000,
      currentUsage: 4200,
      latitude: 40.7128,
      longitude: -74.0060,
      description: 'Primary traffic bridge connecting downtown areas',
    ),
    Infrastructure(
      id: '2',
      name: 'Central Parking Garage',
      type: InfrastructureType.parking,
      zone: 'City Center',
      capacity: 800,
      currentUsage: 650,
      latitude: 40.7589,
      longitude: -73.9851,
    ),
    Infrastructure(
      id: '3',
      name: 'Waste Collection Point A',
      type: InfrastructureType.waste,
      zone: 'North District',
      capacity: 200,
      currentUsage: 180,
      latitude: 40.7831,
      longitude: -73.9712,
    ),
    Infrastructure(
      id: '4',
      name: 'Water Treatment Plant',
      type: InfrastructureType.water,
      zone: 'East Side',
      capacity: 10000,
      currentUsage: 7500,
      latitude: 40.7282,
      longitude: -73.7949,
    ),
    Infrastructure(
      id: '5',
      name: 'Bus Terminal Central',
      type: InfrastructureType.transport,
      zone: 'Downtown',
      capacity: 1500,
      currentUsage: 450,
      latitude: 40.7505,
      longitude: -73.9934,
    ),
  ];

  List<Infrastructure> get infrastructures => _infrastructures;

  void addInfrastructure(Infrastructure infrastructure) {
    _infrastructures.add(infrastructure);
    notifyListeners();
  }

  void updateInfrastructure(Infrastructure infrastructure) {
    final index = _infrastructures.indexWhere((item) => item.id == infrastructure.id);
    if (index != -1) {
      _infrastructures[index] = infrastructure;
      notifyListeners();
    }
  }

  void deleteInfrastructure(String id) {
    _infrastructures.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  List<Infrastructure> getFilteredInfrastructures({
    String? searchQuery,
    InfrastructureType? type,
    String? zone,
    InfrastructureStatus? status,
  }) {
    return _infrastructures.where((infrastructure) {
      final matchesSearch = searchQuery == null || searchQuery.isEmpty ||
          infrastructure.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesType = type == null || infrastructure.type == type;
      final matchesZone = zone == null || infrastructure.zone == zone;
      final matchesStatus = status == null || infrastructure.status == status;
      
      return matchesSearch && matchesType && matchesZone && matchesStatus;
    }).toList();
  }
}