# nosetests --nocapture  tests/test_fit.py


import os
import unittest

from fit.fit import FileHeader
from fit.fit import FitFile
from fit.record import DefinitionMessage, DataMessage


class TestFitFile(unittest.TestCase):

    def test_header(self):
        expected = FileHeader(data_size=100, crc=0)

        _bytes = expected.to_bytes()

        fh = FileHeader.from_bytes(_bytes)

        self.assertEqual(expected, fh)

    def test_parse_activity(self):
        filename = os.path.join(os.path.dirname(__file__), 'data/Activity.fit')
        fit_file = FitFile.from_file(filename)

        output_filename = os.path.join(os.path.dirname(__file__), 'out/Activity.csv')

        fit_file.to_csv(output_filename)

        output_filename = os.path.join(os.path.dirname(__file__), 'out/Activity_out.fit')
        fit_file.to_file(output_filename)

    def test_readwrite_activity(self):
        filename = os.path.join(os.path.dirname(__file__), 'data/Activity.fit')
        output_filename = os.path.join(os.path.dirname(__file__), 'out/Activity_out.fit')

        FitFile.fromto_file(filename, output_filename)

    def test_readwrite_developer_data(self):
        filename = os.path.join(os.path.dirname(__file__), 'data/DeveloperData.fit')

        output_filename = os.path.join(os.path.dirname(__file__), 'out/DeveloperData_out.fit')

        FitFile.fromto_file(filename, output_filename)

    def test_parse_developer_data(self):
        filename = os.path.join(os.path.dirname(__file__), 'data/DeveloperData.fit')
        fit_file = FitFile.from_file(filename)

        output_filename = os.path.join(os.path.dirname(__file__), 'out/DeveloperData.csv')

        fit_file.to_csv(output_filename)

        output_filename = os.path.join(os.path.dirname(__file__), 'out/developer_data.fit')

        fit_file.to_file(output_filename)

    def test_generate_fit_manually(self):
        fit_file = FitFile()
        profile = fit_file.profile

        #
        # FILE ID
        #
        local_msg_type = 0
        msg_name = 'file_id'
        field_defs = [fit_file.create_field_definition(msg_name, 'type'),
                      fit_file.create_field_definition(msg_name, 'manufacturer')]
        msg_def = DefinitionMessage(local_msg_type=local_msg_type,
                                    is_little_endian=True,
                                    global_msg_num=profile.get_message_by_name(
                                        msg_name).id,
                                    field_defs=field_defs,
                                    dev_field_defs=[])
        fit_file.add_record(msg_def)

        fields = [fit_file.create_field(msg_name, 'type', 6),
                  fit_file.create_field(msg_name, 'manufacturer', 1)]

        record = DataMessage(msg_def, fields)
        fit_file.add_record(record)

        output_filename1 = os.path.join(os.path.dirname(__file__), 'out/test.fit')
        output_filename2 = os.path.join(os.path.dirname(__file__), 'out/test-out.fit')
        fit_file.to_file(output_filename1)

        FitFile.fromto_file(output_filename1, output_filename2)

    def test_reconstruct_fit_file(self):
        filename = os.path.join(os.path.dirname(__file__), 'data/Activity.fit')

        fit_file = FitFile.from_file(filename)

        new_fit_file = FitFile()

        for record in fit_file.records:
            new_fit_file.add_record(record)

        new_fit_file.update_header()
        new_fit_file.update_crc()
        self.assertEqual(fit_file.crc, new_fit_file.crc)

    def test_to_csv(self):
        filename = os.path.join(os.path.dirname(__file__),
                                'data/Activity.fit')

        fit_file = FitFile.from_file(filename)

        output_filename = os.path.join(os.path.dirname(__file__), 'out/test.csv')
        fit_file.to_csv(output_filename)

        # import csv
        # with open(output_filename) as csv_file:
        #     csv_reader = csv.reader(csv_file)
        #     for row in csv_reader:
        #         print(', '.join(row))
