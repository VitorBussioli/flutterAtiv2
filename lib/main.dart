import 'models/account.dart';
import 'services/bank_service.dart';

void main() {
  var bankService = BankService<num>();

  var account1 = Account<num>('Conta Corrente', 2500.00);
  var account2 = Account<num>('Poupança', 1500.00);

  bankService.addAccount(account1);
  bankService.addAccount(account2);

  for (var account in bankService.getAllAccounts()) {
    print('Conta: ${account.accountName}, Saldo: R\$${account.balance}');
  }

  account1.deposit(500.00);
  account2.withdraw(200.00);

  print('Saldo atualizado Conta Corrente: R\$${account1.balance}');
  print('Saldo atualizado Poupança: R\$${account2.balance}');
}
