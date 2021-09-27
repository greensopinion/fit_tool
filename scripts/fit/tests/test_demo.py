# nosetests --nocapture  tests/test_demo.py


import os
import unittest

from fit.fit import FitFile
from fit.profile.workout_step_message import WorkoutStepMessage
from fit.record import DataMessage


class TestFitFile(unittest.TestCase):

    def test_convert_workout_to_percent(self):

        MSG_WORKOUT_STEP = 27
        WKT_STEP_TARGET_HEART_RATE = 1
        WKT_STEP_TARGET_POWER = 4
        CUSTOM_ZONE = 0
        POWER_PERCENT_OFFSET = 1000
        HEART_RATE_PERCENT_OFFSET = 100

        ftp = 100  # your ftp in watts
        fthr = 100  # your fthr in bpm

        filename = os.path.join(os.path.dirname(__file__),
                                'data/workout.fit')

        fit_file = FitFile.from_file(filename)

        new_fit_file = FitFile()

        for record in fit_file.records:
            # if isinstance(record, DataMessage) and record.msg_def.global_msg_num == MSG_WORKOUT_STEP:
            if isinstance(record, WorkoutStepMessage):
                name = record.wkt_step_name
                print(f'>> name: {name}')
                target_type = record.get_field_by_name('target_type')
                target_value = record.get_field_by_name('target_value')

                custom_target_low = record.get_field_by_name('custom_target_value_low')
                custom_target_high = record.get_field_by_name('custom_target_value_high')

                if target_type.value == WKT_STEP_TARGET_POWER and target_value.value == CUSTOM_ZONE:
                    custom_target_low.value = (custom_target_low.value - POWER_PERCENT_OFFSET) / ftp * 100
                    custom_target_high.value = (custom_target_high.value - POWER_PERCENT_OFFSET) / ftp * 100

                if target_type.value == WKT_STEP_TARGET_HEART_RATE and target_value.value == CUSTOM_ZONE:
                    custom_target_low.value = (custom_target_low.value - HEART_RATE_PERCENT_OFFSET) / fthr * 100
                    custom_target_high.value = (custom_target_high.value - HEART_RATE_PERCENT_OFFSET) / fthr * 100

            new_fit_file.add_record(record)

        output_filename = os.path.join(os.path.dirname(__file__), 'out/workout_percent.fit')
        fit_file.to_file(output_filename)
