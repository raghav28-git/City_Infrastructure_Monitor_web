import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final String currentPage;
  final Function(String) onPageChanged;

  const Sidebar({
    Key? key,
    required this.currentPage,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  int? hoveredIndex;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _widthAnimation = Tween<double>(begin: 80, end: 280).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.3, 1.0, curve: Curves.easeIn)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<SidebarItem> menuItems = [
    SidebarItem('Dashboard', Icons.dashboard_outlined, Icons.dashboard),
    SidebarItem('Infrastructure', Icons.apartment_outlined, Icons.apartment),
    SidebarItem('Alerts', Icons.notifications_outlined, Icons.notifications),
    SidebarItem('Analytics', Icons.analytics_outlined, Icons.analytics),
    SidebarItem('Settings', Icons.settings_outlined, Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: _widthAnimation.value,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(4, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                Expanded(child: _buildMenuItems()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ClipRect(
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6366F1).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.location_city, color: Colors.white, size: 22),
            ),
            if (isHovered) ...[
              const SizedBox(width: 12),
              Flexible(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Smart City',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                          letterSpacing: 0.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        'Infrastructure Monitor',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                          letterSpacing: 0.3,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        final isActive = widget.currentPage == item.title;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: MouseRegion(
            onEnter: (_) => setState(() => hoveredIndex = index),
            onExit: (_) => setState(() => hoveredIndex = null),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => widget.onPageChanged(item.title),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: _widthAnimation.value > 150 ? 16 : 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    gradient: isActive
                        ? LinearGradient(
                            colors: [
                              const Color(0xFF6366F1).withOpacity(0.2),
                              const Color(0xFF8B5CF6).withOpacity(0.1),
                            ],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(12),
                    border: isActive
                        ? Border.all(color: const Color(0xFF6366F1).withOpacity(0.3), width: 1)
                        : null,
                  ),
                  child: ClipRect(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedScale(
                          scale: hoveredIndex == index ? 1.5 : 1.0,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutBack,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              gradient: isActive
                                  ? const LinearGradient(
                                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              isActive ? item.activeIcon : item.icon,
                              color: isActive ? Colors.white : Colors.grey[600],
                              size: 20,
                            ),
                          ),
                        ),
                        if (isHovered && _widthAnimation.value > 150) ...[
                          SizedBox(width: hoveredIndex == index ? 18 : 14),
                          Expanded(
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: isActive ? const Color(0xFF6366F1) : const Color(0xFF64748B),
                                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: 0.3,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SidebarItem {
  final String title;
  final IconData icon;
  final IconData activeIcon;

  SidebarItem(this.title, this.icon, this.activeIcon);
}