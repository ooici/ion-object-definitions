#!/usr/bin/env python

"""
@file setup.py
@author Paul Hubbard
@author David Stuebe
@date 11/19/10
@brief setup file for OOI protobuffers code
"""

try:
    from setuptools import setup, find_packages
except ImportError:
    from distutils.core import setup

setup(
    name = 'ionproto',
    version = '0.3.17',
    description = 'OOI LCA protocol buffers auto-generated code',
    url = 'http://www.oceanobservatories.org/spaces/display/CIDev/LCAARCH+Development+Project',
    download_url = 'http://ooici.net/releases',
    license = 'Apache 2.0',
    author = 'David Stuebe',
    author_email = 'dstuebe@asasciences.com',
    keywords = [
        'ooci',
        'protocol_buffers'
               ],
    dependency_links = [
        'http://ooici.net/releases'
                       ],
    packages = find_packages() + ['net'],
    install_requires = [
        'protobuf==2.3.0-p1'
                       ],
    include_package_data = True,
    classifiers = [
        'Development Status :: 3 - Alpha',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Topic :: Scientific/Engineering'
                  ]
     )
