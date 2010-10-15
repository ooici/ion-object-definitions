from distutils.core import setup 
import fnmatch
import os

pymods = []
for root, dirnames, filenames in os.walk('net'):
  for filename in fnmatch.filter(filenames, '*.py'):
      pymods.append(os.path.join(root, filename[:-3]))

setup(name="ooi_data_format", version="0.000001", py_modules=pymods)
