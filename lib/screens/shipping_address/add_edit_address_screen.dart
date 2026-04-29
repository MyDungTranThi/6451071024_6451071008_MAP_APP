import 'package:flutter/material.dart';
import '../../data/models/address_model.dart';
import '../../controller/address_controller.dart';
import '../../data/services/list_location_service.dart';

class EditAddressScreen extends StatefulWidget {
  final AddressModel? address;
  const EditAddressScreen({super.key, this.address});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final AddressController _controller = AddressController();
  final LocationService _locationService = LocationService();
  final _formKey = GlobalKey<FormState>();

  List<dynamic> _cities = [];
  List<dynamic> _wards = [];
  String? _selectedCity;
  String? _selectedWard;
  bool _isDefault = false;
  bool _isLoadingLocation = true;
  bool _isSaving = false;

  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    try {
      final cities = await _locationService.fetchCities();
      if (mounted) {
        setState(() { _cities = cities; _isLoadingLocation = false; });
        if (widget.address != null) {
          _selectedCity = widget.address!.city;
          _selectedWard = widget.address!.ward;
          _streetController.text = widget.address!.street;
          _numberController.text = widget.address!.number;
          _receiverNameController.text = widget.address!.receiverName;
          _phoneNumberController.text = widget.address!.phoneNumber;
          _isDefault = widget.address!.isDefault;
          _loadWardsFromCity(_selectedCity);
        }
      }
    } catch (e) {
      if (mounted) setState(() => _isLoadingLocation = false);
    }
  }

  void _loadWardsFromCity(String? cityName) {
    if (cityName == null) return;
    final city = _cities.firstWhere((c) => c['name'] == cityName, orElse: () => null);
    if (city != null) setState(() => _wards = city['wards']);
  }

  void _onCityChanged(String? value) {
    setState(() { _selectedCity = value; _selectedWard = null; _wards = []; });
    _loadWardsFromCity(value);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    final address = AddressModel(
      id: widget.address?.id ?? '', city: _selectedCity!, ward: _selectedWard!,
      street: _streetController.text.trim(), number: _numberController.text.trim(),
      receiverName: _receiverNameController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim(),
      isDefault: _isDefault, latitude: 0.0, longitude: 0.0,
    );
    try {
      if (widget.address == null) await _controller.addAddress(address);
      else await _controller.updateAddress(address);
      if (_isDefault && widget.address != null) await _controller.setDefaultAddress(widget.address!.id);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingLocation) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(widget.address == null ? 'Thêm địa chỉ mới' : 'Sửa địa chỉ'),
        elevation: 0, backgroundColor: Colors.white, foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("THÔNG TIN LIÊN HỆ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 12),
              TextFormField(
                controller: _receiverNameController,
                decoration: InputDecoration(labelText: "Tên người nhận", prefixIcon: const Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                validator: (v) => (v == null || v.isEmpty) ? 'Nhập tên người nhận' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Số điện thoại", prefixIcon: const Icon(Icons.phone), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Nhập số điện thoại';
                  if (!RegExp(r'^0\d{9}$').hasMatch(v)) return 'Số điện thoại không hợp lệ';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text("THÔNG TIN VỊ TRÍ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                isExpanded: true, value: _selectedCity,
                hint: const Text("Chọn Tỉnh/Thành phố"),
                decoration: InputDecoration(prefixIcon: const Icon(Icons.location_city), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                items: _cities.map((c) => DropdownMenuItem(value: c['name'] as String, child: Text(c['name'], overflow: TextOverflow.ellipsis))).toList(),
                onChanged: _onCityChanged,
                validator: (v) => v == null ? 'Vui lòng chọn tỉnh/thành' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                isExpanded: true, value: _selectedWard,
                hint: const Text("Chọn Phường/Xã"),
                decoration: InputDecoration(prefixIcon: const Icon(Icons.map), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                items: _wards.map((w) => DropdownMenuItem(value: w['name'] as String, child: Text(w['name'], overflow: TextOverflow.ellipsis))).toList(),
                onChanged: (v) => setState(() => _selectedWard = v),
                validator: (v) => v == null ? 'Vui lòng chọn phường/xã' : null,
              ),
              const SizedBox(height: 24),
              const Text("CHI TIẾT ĐỊA CHỈ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 12),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(labelText: "Tên đường", prefixIcon: const Icon(Icons.signpost), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                validator: (v) => (v == null || v.isEmpty) ? 'Nhập tên đường' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(labelText: "Số nhà", prefixIcon: const Icon(Icons.home), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                validator: (v) => (v == null || v.isEmpty) ? 'Nhập số nhà' : null,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                contentPadding: EdgeInsets.zero, value: _isDefault, activeColor: Colors.blue,
                title: const Text('Đặt làm địa chỉ mặc định'),
                onChanged: (v) => setState(() => _isDefault = v),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity, height: 55,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700], foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: _isSaving
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('Lưu địa chỉ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streetController.dispose();
    _numberController.dispose();
    _receiverNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
