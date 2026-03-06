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
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<SidebarItem> menuItems = [
    SidebarItem('Dashboard', Icons.dashboard_outlined, Icons.dashboard),
    SidebarItem('Infrastructure', Icons.apartment_outlined, Icons.apartment),
    SidebarItem('Map Monitoring', Icons.map_outlined, Icons.map),
    SidebarItem('Alerts', Icons.notifications_outlined, Icons.notifications),
    SidebarItem('Analytics', Icons.analytics_outlined, Icons.analytics),
    SidebarItem('Settings', Icons.settings_outlined, Icons.settings),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 80 : 280,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildMenuItems()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.location_city, color: Colors.white, size: 24),
          ),
          if (!isCollapsed) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Smart City',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  Text(
                    'Infrastructure Monitor',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
          IconButton(
            onPressed: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            icon: Icon(
              isCollapsed ? Icons.menu : Icons.menu_open,
              color: Colors.grey[600],
            ),
          ),
        ],
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
          margin: const EdgeInsets.only(bottom: 4),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => widget.onPageChanged(item.title),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF4F46E5).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      isActive ? item.activeIcon : item.icon,
                      color: isActive ? const Color(0xFF4F46E5) : Colors.grey[600],
                      size: 20,
                    ),
                    if (!isCollapsed) ...[
                      const SizedBox(width: 12),
                      Text(
                        item.title,
                        style: TextStyle(
                          color: isActive ? const Color(0xFF4F46E5) : const Color(0xFF374151),
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
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