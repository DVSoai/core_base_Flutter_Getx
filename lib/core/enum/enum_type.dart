abstract interface class StringEnum {
  final String value;

  const StringEnum(this.value);
}

abstract interface class NumberEnum {
  final int value;
  final String name;

  const NumberEnum(this.value, this.name);
}
