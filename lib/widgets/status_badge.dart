import 'package:flutter/material.dart';
import '../models/infrastructure.dart';

class StatusBadge extends StatelessWidget {
  final InfrastructureStatus status;
  final bool isSmall;

  const StatusBadge({
    Key? key,
    required this.status,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6 : 8,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor().withOpacity(0.3)),
      ),
      child: Text(
        status.displayName.toUpperCase(),
        style: TextStyle(
          fontSize: isSmall ? 10 : 11,
          fontWeight: FontWeight.w700,
          color: _getStatusColor(),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case InfrastructureStatus.normal:
        return Colors.green[600]!;
      case InfrastructureStatus.highUsage:
        return Colors.orange[600]!;
      case InfrastructureStatus.overload:
        return Colors.red[600]!;
      case InfrastructureStatus.underused:
        return Colors.blue[600]!;
    }
  }
}