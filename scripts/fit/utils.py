import logging

# noinspection SpellCheckingInspection
FORMAT = '%(asctime)s %(message)s'
logging.basicConfig(format=FORMAT)
logger = logging.getLogger('fit')
logger.setLevel(logging.INFO)
