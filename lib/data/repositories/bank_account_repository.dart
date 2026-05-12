import '../models/bank_account_model.dart';
import '../services/bank_account_service.dart';

class BankAccountRepository {
  BankAccountRepository({BankAccountService? bankAccountService})
    : _bankAccountService = bankAccountService ?? BankAccountService();

  final BankAccountService _bankAccountService;

  Stream<List<BankAccountModel>> getBanks() {
    return _bankAccountService.getBanks();
  }

  Future<void> addBank(BankAccountModel bank) {
    return _bankAccountService.addBank(bank);
  }

  Future<void> updateBank(BankAccountModel bank) {
    return _bankAccountService.updateBank(bank);
  }

  Future<void> deleteBank(String id) {
    return _bankAccountService.deleteBank(id);
  }
}
