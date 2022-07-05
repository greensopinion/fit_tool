import 'package:collection/collection.dart';

import 'base_type.dart';
import 'field.dart';
import 'field_component.dart';

class SubField {
  SubField({
    this.name = 'unknown',
    this.type = BaseType.ENUM,
    this.scale = 1.0,
    this.offset = 0.0,
    this.units = '',
    Map<int, List<int>>? referenceMap,
    List<FieldComponent>? components,
  })  : referenceMap = referenceMap ?? {},
        components = components ?? [];

  final String name;
  final BaseType type;
  final double scale;
  final double offset;
  final String units;
  final Map<int, List<int>> referenceMap; // <field id, value>
  final List<FieldComponent> components;

  void addComponent(FieldComponent component) {
    components.add(component);
  }

  bool isValid(List<Field> fields) {
    for (var id in referenceMap.keys) {
      var field = fields.firstWhereOrNull((field) => field.id == id);
      if (field == null || field.isNotValid()) {
        continue;
      }
      if (referenceMap[id]?.contains(field.getValue()) ?? false) {
        return true;
      }
    }

    return false;
  }
}
