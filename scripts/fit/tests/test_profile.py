# nosetests --nocapture  tests/test_demo.py


import os
import unittest

from fit.fit import Profile


class TestFitFile(unittest.TestCase):

    def test_profile(self):
        profile = Profile.get_default_profile();

        for type_name in profile.types_by_name:
            profileType = profile.types_by_name[type_name]
            print(f'{type_name}', profileType)



