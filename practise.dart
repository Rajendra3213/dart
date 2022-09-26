void main() {
  try {
    var obj = 4 ~/ 2;
    print(obj);
    // ignore: deprecated_member_use_from_same_package
  } on IntegerDivisionByZeroException catch (e) {
    print("can't be divided by zer0");
  } finally {
    print("i am always here");
  }
}
