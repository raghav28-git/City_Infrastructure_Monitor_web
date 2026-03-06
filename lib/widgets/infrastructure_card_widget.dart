import 'package:flutter/material.dart';
import '../models/infrastructure.dart';
import 'status_badge.dart';
import 'utilization_bar.dart';

class InfrastructureCardWidget extends StatefulWidget {
  final Infrastructure infrastructure;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;

  const InfrastructureCardWidget({
    Key? key,
    required this.infrastructure,
    this.onEdit,
    this.onDelete,
    this.onView,
  }) : super(key: key);

  @override
  State<InfrastructureCardWidget> createState() => _InfrastructureCardWidgetState();
}

class _InfrastructureCardWidgetState extends State<InfrastructureCardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0.0, isHovered ? -2.0 : 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered ? const Color(0xFF4F46E5).withOpacity(0.3) : Colors.grey[200]!,
            width: isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.black.withOpacity(0.1) : Colors.black.withOpacity(0.05),
              blurRadius: isHovered ? 15 : 8,
              offset: Offset(0, isHovered ? 6 : 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _getTypeColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getTypeIcon(),
                      color: _getTypeColor(),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.infrastructure.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.infrastructure.type.displayName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(status: widget.infrastructure.status, isSmall: true),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zone',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          widget.infrastructure.zone,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Usage',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          '${widget.infrastructure.currentUsage}/${widget.infrastructure.capacity}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              UtilizationBar(
                percentage: widget.infrastructure.utilizationPercentage,
                height: 4,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.visibility_outlined,
                      label: 'View',
                      onPressed: widget.onView,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.edit_outlined,
                      label: 'Edit',
                      onPressed: widget.onEdit,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.delete_outline,
                      label: 'Delete',
                      onPressed: widget.onDelete,
                      isDestructive: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    bool isDestructive = false,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 16,
        color: isDestructive ? Colors.red[600] : Colors.grey[600],
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: isDestructive ? Colors.red[600] : Colors.grey[600],
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Color _getTypeColor() {
    switch (widget.infrastructure.type) {
      case InfrastructureType.traffic:
        return Colors.blue[600]!;
      case InfrastructureType.parking:
        return Colors.purple[600]!;
      case InfrastructureType.waste:
        return Colors.green[600]!;
      case InfrastructureType.water:
        return Colors.cyan[600]!;
      case InfrastructureType.transport:
        return Colors.orange[600]!;
    }
  }

  IconData _getTypeIcon() {
    switch (widget.infrastructure.type) {
      case InfrastructureType.traffic:
        return Icons.traffic;
      case InfrastructureType.parking:
        return Icons.local_parking;
      case InfrastructureType.waste:
        return Icons.delete;
      case InfrastructureType.water:
        return Icons.water_drop;
      case InfrastructureType.transport:
        return Icons.directions_bus;
    }
  }
}