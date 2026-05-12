import '../data/models/bank_account_model.dart';
import '../data/repositories/bank_account_repository.dart';

class BankAccountController {
  BankAccountController({BankAccountRepository? bankAccountRepository})
    : _bankAccountRepository = bankAccountRepository ?? BankAccountRepository();

  final BankAccountRepository _bankAccountRepository;

  Stream<List<BankAccountModel>> getBanks() {
    return _bankAccountRepository.getBanks();
  }

  Future<void> addBank(BankAccountModel bank) async {
    await _bankAccountRepository.addBank(bank);
  }

  Future<void> updateBank(BankAccountModel bank) async {
    await _bankAccountRepository.updateBank(bank);
  }

  Future<void> deleteBank(String id) async {
    await _bankAccountRepository.deleteBank(id);
  }
}
