import 'dart:async';
import 'dart:math';
import '../models/infrastructure_asset.dart';

class InfrastructureService {
  static final _instance = InfrastructureService._internal();
  factory InfrastructureService() => _instance;
  InfrastructureService._internal();

  final _random = Random();
  late List<InfrastructureAsset> _assets;
  final _controller = StreamController<List<InfrastructureAsset>>.broadcast();

  Stream<List<InfrastructureAsset>> get assetsStream => _controller.stream;

  void initialize() {
    _assets = [
      InfrastructureAsset(id: '1', name: 'Main Highway', type: AssetType.road, capacity: 5000, currentUsage: 3200, location: 'Downtown'),
      InfrastructureAsset(id: '2', name: 'Central Bridge', type: AssetType.bridge, capacity: 2000, currentUsage: 2100, location: 'River District'),
      InfrastructureAsset(id: '3', name: 'Metro Line A', type: AssetType.publicTransport, capacity: 8000, currentUsage: 1800, location: 'City Center'),
      InfrastructureAsset(id: '4', name: 'Power Grid Zone 1', type: AssetType.powerGrid, capacity: 1000, currentUsage: 850, location: 'North District'),
      InfrastructureAsset(id: '5', name: 'Water Treatment Plant', type: AssetType.waterSystem, capacity: 50000, currentUsage: 42000, location: 'East Side'),
      InfrastructureAsset(id: '6', name: 'Underground Tunnel', type: AssetType.tunnel, capacity: 1500, currentUsage: 1600, location: 'West End'),
    ];
    
    Timer.periodic(Duration(seconds: 3), (_) => _updateUsage());
    _controller.add(_assets);
  }

  void _updateUsage() {
    _assets = _assets.map((asset) {
      final variation = (_random.nextDouble() - 0.5) * 0.2;
      final newUsage = (asset.currentUsage * (1 + variation)).clamp(0.0, asset.capacity * 1.5);
      
      return InfrastructureAsset(
        id: asset.id,
        name: asset.name,
        type: asset.type,
        capacity: asset.capacity,
        currentUsage: newUsage,
        location: asset.location,
      );
    }).toList();
    
    _controller.add(_assets);
  }

  List<InfrastructureAsset> get currentAssets => _assets;

  void dispose() {
    _controller.close();
  }
}