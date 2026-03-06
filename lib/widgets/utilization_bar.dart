import 'package:flutter/material.dart';

class UtilizationBar extends StatefulWidget {
  final double percentage;
  final bool showLabel;
  final double height;

  const UtilizationBar({
    Key? key,
    required this.percentage,
    this.showLabel = true,
    this.height = 6,
  }) : super(key: key);

  @override
  State<UtilizationBar> createState() => _UtilizationBarState();
}

class _UtilizationBarState extends State<UtilizationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.percentage / 100,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showLabel) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Utilization',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '${widget.percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _getUtilizationColor(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _animation.value.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getUtilizationColor().withOpacity(0.7),
                        _getUtilizationColor(),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(widget.height / 2),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getUtilizationColor() {
    if (widget.percentage >= 100) return Colors.red[500]!;
    if (widget.percentage >= 80) return Colors.orange[500]!;
    if (widget.percentage <= 30) return Colors.blue[500]!;
    return Colors.green[500]!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}