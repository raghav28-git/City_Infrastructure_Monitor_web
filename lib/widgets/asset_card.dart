import 'package:flutter/material.dart';
import '../models/infrastructure_asset.dart';

class AssetCard extends StatelessWidget {
  final InfrastructureAsset asset;

  const AssetCard({super.key, required this.asset});

  Color _getStatusColor() {
    switch (asset.status) {
      case UtilizationStatus.underused: return Colors.blue;
      case UtilizationStatus.normal: return Colors.green;
      case UtilizationStatus.congested: return Colors.orange;
      case UtilizationStatus.overloaded: return Colors.red;
    }
  }

  IconData _getAssetIcon() {
    switch (asset.type) {
      case AssetType.road: return Icons.directions_car;
      case AssetType.bridge: return Icons.architecture;
      case AssetType.tunnel: return Icons.subway;
      case AssetType.powerGrid: return Icons.electrical_services;
      case AssetType.waterSystem: return Icons.water_drop;
      case AssetType.publicTransport: return Icons.train;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getAssetIcon(), color: _getStatusColor(), size: 24),
                SizedBox(width: 8),
                Expanded(
                  child: Text(asset.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(asset.statusText, style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(asset.location, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: (asset.utilizationPercentage / 100).clamp(0.0, 1.0),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(_getStatusColor()),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${asset.currentUsage.toInt()} / ${asset.capacity.toInt()}'),
                Text('${asset.utilizationPercentage.toStringAsFixed(1)}%', 
                     style: TextStyle(fontWeight: FontWeight.bold, color: _getStatusColor())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}