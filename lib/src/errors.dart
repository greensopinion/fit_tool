/// This error thrown when trying to access a field in a record where the field is
/// not defined in the associated definition message.
class FieldNotDefinedError extends Error {
  final String message;
  FieldNotDefinedError(this.message);
  @override
  String toString() => 'Field not defined: $message';
}
