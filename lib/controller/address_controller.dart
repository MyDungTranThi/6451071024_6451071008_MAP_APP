import '../data/models/address_model.dart';
import '../data/repositories/address_repository.dart';

class AddressController {
  AddressController({AddressRepository? addressRepository})
    : _addressRepository = addressRepository ?? AddressRepository();

  final AddressRepository _addressRepository;

  Stream<List<AddressModel>> getAddresses() {
    return _addressRepository.getAddresses();
  }

  Future<void> addAddress(AddressModel address) async {
    await _addressRepository.addAddress(address);
  }

  Future<void> updateAddress(AddressModel address) async {
    await _addressRepository.updateAddress(address);
  }

  Future<void> setDefaultAddress(String id) async {
    await _addressRepository.setDefaultAddress(id);
  }

  Future<void> deleteAddress(String id) async {
    await _addressRepository.deleteAddress(id);
  }
}
