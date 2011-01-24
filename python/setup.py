#!/usr/bin/env python

"""
@file setup.py
@author Paul Hubbard
@author David Stuebe
@date 11/19/10
@brief setup file for OOI protobuffers code
"""

setupdict = {
    'name' : 'ionproto',
    'version' : '0.2.3',
    'description' : 'OOI LCA protocol buffers auto-generated code',
    'url': 'http://www.oceanobservatories.org/spaces/display/CIDev/LCAARCH+Development+Project',
    'download_url' : 'http://ooici.net/packages',
    'license' : 'Apache 2.0',
    'author' :'David Stuebe',
    'author_email' : 'dstuebe@asasciences.com',
    'keywords': ['ooci','protocol_buffers'],
    'classifiers' : [
    'Development Status :: 3 - Alpha',
    'Environment :: Console',
    'Intended Audience :: Developers',
    'License :: OSI Approved :: Apache Software License',
    'Operating System :: OS Independent',
    'Programming Language :: Python',
    'Topic :: Scientific/Engineering'],
}

try:
    from setuptools import setup, find_packages
    setupdict['packages'] = find_packages()
    setupdict['install_requires'] = ['protobuf==2.3.0']
    setupdict['include_package_data'] = True
    setup(**setupdict)

except ImportError:
    from distutils.core import setup
    setupdict['packages'] = ['net']
    setup(**setupdict)
