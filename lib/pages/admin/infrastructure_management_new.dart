import 'package:flutter/material.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_app_bar.dart';
import '../../widgets/status_badge.dart';
import '../../widgets/utilization_bar.dart';
import '../../widgets/infrastructure_card_widget.dart';
import '../../models/infrastructure.dart';

class InfrastructureManagement extends StatefulWidget {
  @override
  State<InfrastructureManagement> createState() => _InfrastructureManagementState();
}

class _InfrastructureManagementState extends State<InfrastructureManagement>
    with SingleTickerProviderStateMixin {
  String currentPage = 'Infrastructure';
  bool isCardView = false;
  String searchQuery = '';
  InfrastructureType? selectedType;
  String? selectedZone;
  InfrastructureStatus? selectedStatus;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Infrastructure> infrastructures = [
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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const TopAppBar(),
      body: Row(
        children: [
          Sidebar(
            currentPage: currentPage,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _buildMainContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(),
          const SizedBox(height: 24),
          _buildFilterSection(),
          const SizedBox(height: 24),
          _buildViewToggle(),
          const SizedBox(height: 16),
          isCardView ? _buildCardView() : _buildTableView(),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Infrastructure Management',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Manage city infrastructure resources and monitor capacity utilization.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAddButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton.icon(
          onPressed: _showAddInfrastructureModal,
          icon: const Icon(Icons.add, size: 20),
          label: const Text('Add Infrastructure'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter & Search',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search infrastructure by name...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF4F46E5)),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdown<InfrastructureType>(
                  'Type',
                  selectedType,
                  InfrastructureType.values,
                  (value) => setState(() => selectedType = value),
                  (type) => type?.displayName ?? 'All Types',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdown<String>(
                  'Zone',
                  selectedZone,
                  ['Downtown', 'City Center', 'North District', 'East Side', 'West End'],
                  (value) => setState(() => selectedZone = value),
                  (zone) => zone ?? 'All Zones',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdown<InfrastructureStatus>(
                  'Status',
                  selectedStatus,
                  InfrastructureStatus.values,
                  (value) => setState(() => selectedStatus = value),
                  (status) => status?.displayName ?? 'All Status',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>(
    String label,
    T? selectedValue,
    List<T> items,
    Function(T?) onChanged,
    String Function(T?) displayText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          value: selectedValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4F46E5)),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            DropdownMenuItem<T>(
              value: null,
              child: Text(displayText(null)),
            ),
            ...items.map((item) => DropdownMenuItem<T>(
              value: item,
              child: Text(displayText(item)),
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildViewToggle() {
    return Row(
      children: [
        const Text(
          'View Mode:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildToggleButton(
                icon: Icons.table_rows,
                label: 'Table',
                isSelected: !isCardView,
                onPressed: () => setState(() => isCardView = false),
              ),
              _buildToggleButton(
                icon: Icons.grid_view,
                label: 'Cards',
                isSelected: isCardView,
                onPressed: () => setState(() => isCardView = true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: isSelected ? const Color(0xFF4F46E5) : Colors.grey[600],
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFF4F46E5) : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableView() {
    final filteredInfrastructures = _getFilteredInfrastructures();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          ...filteredInfrastructures.map((infrastructure) => 
            _buildTableRow(infrastructure)),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Text(
              'Infrastructure Name',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Type',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Zone',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Capacity',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Usage',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Text(
              'Utilization',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Status',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const SizedBox(
            width: 100,
            child: Text(
              'Actions',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(Infrastructure infrastructure) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              infrastructure.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          Expanded(
            child: Text(
              infrastructure.type.displayName,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              infrastructure.zone,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              infrastructure.capacity.toString(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              infrastructure.currentUsage.toString(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: UtilizationBar(
              percentage: infrastructure.utilizationPercentage,
              showLabel: false,
              height: 4,
            ),
          ),
          Expanded(
            child: StatusBadge(
              status: infrastructure.status,
              isSmall: true,
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_outlined, size: 16),
                  tooltip: 'View Details',
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(4),
                ),
                IconButton(
                  onPressed: () => _showEditInfrastructureModal(infrastructure),
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  tooltip: 'Edit',
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(4),
                ),
                IconButton(
                  onPressed: () => _showDeleteConfirmation(infrastructure),
                  icon: Icon(Icons.delete_outline, size: 16, color: Colors.red[600]),
                  tooltip: 'Delete',
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardView() {
    final filteredInfrastructures = _getFilteredInfrastructures();
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: filteredInfrastructures.length,
      itemBuilder: (context, index) {
        final infrastructure = filteredInfrastructures[index];
        return InfrastructureCardWidget(
          infrastructure: infrastructure,
          onView: () {},
          onEdit: () => _showEditInfrastructureModal(infrastructure),
          onDelete: () => _showDeleteConfirmation(infrastructure),
        );
      },
    );
  }

  List<Infrastructure> _getFilteredInfrastructures() {
    return infrastructures.where((infrastructure) {
      final matchesSearch = searchQuery.isEmpty ||
          infrastructure.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesType = selectedType == null || infrastructure.type == selectedType;
      final matchesZone = selectedZone == null || infrastructure.zone == selectedZone;
      final matchesStatus = selectedStatus == null || infrastructure.status == selectedStatus;
      
      return matchesSearch && matchesType && matchesZone && matchesStatus;
    }).toList();
  }

  void _showAddInfrastructureModal() {
    showDialog(
      context: context,
      builder: (context) => _InfrastructureModal(),
    );
  }

  void _showEditInfrastructureModal(Infrastructure infrastructure) {
    showDialog(
      context: context,
      builder: (context) => _InfrastructureModal(infrastructure: infrastructure),
    );
  }

  void _showDeleteConfirmation(Infrastructure infrastructure) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Infrastructure'),
        content: Text('Are you sure you want to delete "${infrastructure.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle delete
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _InfrastructureModal extends StatefulWidget {
  final Infrastructure? infrastructure;

  const _InfrastructureModal({this.infrastructure});

  @override
  State<_InfrastructureModal> createState() => _InfrastructureModalState();
}

class _InfrastructureModalState extends State<_InfrastructureModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  InfrastructureType? _selectedType;
  String? _selectedZone;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.infrastructure != null) {
      _nameController.text = widget.infrastructure!.name;
      _capacityController.text = widget.infrastructure!.capacity.toString();
      _latitudeController.text = widget.infrastructure!.latitude.toString();
      _longitudeController.text = widget.infrastructure!.longitude.toString();
      _descriptionController.text = widget.infrastructure!.description ?? '';
      _selectedType = widget.infrastructure!.type;
      _selectedZone = widget.infrastructure!.zone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.infrastructure == null ? 'Add Infrastructure' : 'Edit Infrastructure',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Infrastructure Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty == true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<InfrastructureType>(
                value: _selectedType,
                onChanged: (value) => setState(() => _selectedType = value),
                decoration: const InputDecoration(
                  labelText: 'Infrastructure Type',
                  border: OutlineInputBorder(),
                ),
                items: InfrastructureType.values.map((type) => 
                  DropdownMenuItem(
                    value: type,
                    child: Text(type.displayName),
                  ),
                ).toList(),
                validator: (value) => value == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedZone,
                onChanged: (value) => setState(() => _selectedZone = value),
                decoration: const InputDecoration(
                  labelText: 'Zone',
                  border: OutlineInputBorder(),
                ),
                items: ['Downtown', 'City Center', 'North District', 'East Side', 'West End']
                    .map((zone) => DropdownMenuItem(
                      value: zone,
                      child: Text(zone),
                    )).toList(),
                validator: (value) => value == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _capacityController,
                decoration: const InputDecoration(
                  labelText: 'Capacity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value?.isEmpty == true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _latitudeController,
                      decoration: const InputDecoration(
                        labelText: 'Latitude',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value?.isEmpty == true ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _longitudeController,
                      decoration: const InputDecoration(
                        labelText: 'Longitude',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value?.isEmpty == true ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F46E5),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(widget.infrastructure == null ? 'Add' : 'Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() == true) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      Navigator.pop(context);
    }
  }
}