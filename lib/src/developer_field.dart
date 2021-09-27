import 'base_type.dart';
import 'field.dart';

class DeveloperField extends Field {
  DeveloperField({
    required this.developerDataIndex,
    name = '',
    id = 0,
    type = BaseType.ENUM,
    offset,
    scale,
    units = '',
    isAccumulated = false,
    size = 0,
  }) : super(
            name: name,
            id: id,
            type: type,
            offset: offset,
            scale: scale,
            units: units,
            isAccumulated: isAccumulated,
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
        size: size ?? other.size);
  }
}
