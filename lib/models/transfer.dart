class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return "Value:$value -- AccountNumber:$accountNumber";
  }
}