from fit.record import DataMessage, RecordHeader


class WorkoutStepMessage(DataMessage):

    def __init__(self, msg_def, fields):
        super().__init__(msg_def, fields)

    @property
    def wkt_step_name(self) -> str:
        field = self.get_field_by_name('wkt_step_name')
        return field.value

    @wkt_step_name.setter
    def wkt_step_name(self, name: str):
        field = self.get_field_by_name('wkt_step_name')
        field.value = name
