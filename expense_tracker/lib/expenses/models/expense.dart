class Expense {
  const Expense(
      {required this.amount,
      required this.date,
      required this.id,
      required this.title});

  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
