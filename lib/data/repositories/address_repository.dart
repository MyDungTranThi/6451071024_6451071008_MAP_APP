import '../models/address_model.dart';
import '../services/address_service.dart';

class AddressRepository {
  AddressRepository({AddressService? addressService})
    : _addressService = addressService ?? AddressService();

  final AddressService _addressService;

  Stream<List<AddressModel>> getAddresses() {
    return _addressService.getAddresses();
  }

  Future<void> addAddress(AddressModel address) {
    return _addressService.addAddress(address);
  }

  Future<void> updateAddress(AddressModel address) {
    return _addressService.updateAddress(address);
  }

  Future<void> setDefaultAddress(String id) {
    return _addressService.setDefaultAddress(id);
  }

  Future<void> deleteAddress(String id) {
    return _addressService.deleteAddress(id);
  }
}
