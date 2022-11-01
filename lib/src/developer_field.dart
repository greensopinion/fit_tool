import 'base_type.dart';
import 'field.dart';

class DeveloperField extends Field {
  /// Defines a developer field that can be added to a standard data message.
  ///
  /// [developerDataIndex] and [id] uniquely define the developer field that
  /// must be defined in a previous [FieldDescriptionMessage] message in the
  /// FIT file. In the FIT documentation [id] is referred to as the
  /// "Field Definition Number". A FIT file can contain up to 255 unique fields
  /// per developer. [size] describes how big the field is in bytes.
  DeveloperField({
    required this.developerDataIndex,
    name = '',
    id = 0,
    type = BaseType.ENUM,
    offset,
    scale,
    units = '',
    isAccumulated = false,
    growable = true,
    size = 0,
  }) : super(
            name: name,
            id: id,
            type: type,
            offset: offset,
            scale: scale,
            units: units,
            isAccumulated: isAccumulated,
            growable: growable,
            size: size);

  final int developerDataIndex;

  factory DeveloperField.from(DeveloperField other, {int? size}) {
    return DeveloperField(
        developerDataIndex: other.developerDataIndex,
        name: other.name,
        id: other.id,
        type: other.type,
        offset: other.offset,
        scale: other.scale,
        units: other.units,
        growable: other.growable,
        size: size ?? other.size);
  }
}
