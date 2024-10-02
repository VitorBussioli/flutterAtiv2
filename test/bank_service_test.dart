import 'package:test/test.dart';
import '../lib/models/account.dart';
import '../lib/services/bank_service.dart';

void main() {
  group('BankService Tests', () {
    late BankService<num> bankService;
    late Account<num> account;

    setUp(() {
      bankService = BankService<num>();
      account = Account<num>('Conta Corrente', 1000.00);
      bankService.addAccount(account);
    });

    test('Adicionar uma conta ao banco', () {
      expect(bankService.getAllAccounts().length, equals(1));
    });

    test('Encontrar uma conta por nome', () {
      var foundAccount = bankService.findAccount('Conta Corrente');
      expect(foundAccount, isNotNull);
      expect(foundAccount.accountName, equals('Conta Corrente'));
    });

    test('Depositar na conta', () {
      account.deposit(500.00);
      expect(account.balance, equals(1500.00));
    });

    test('Sacar da conta', () {
      account.withdraw(300.00);
      expect(account.balance, equals(700.00));
    });

    test('Saque maior que o saldo deve lançar exceção', () {
      expect(() => account.withdraw(2000.00), throwsException);
    });
  });
}
