class FieldComponent {
  FieldComponent(
      this.fieldNum, this.accumulate, this.bits, this.scale, this.offset);

  final int fieldNum;
  final bool accumulate;
  final int bits;
  final double scale;
  final double offset;
}
