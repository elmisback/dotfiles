#!/usr/bin/env python

from setuptools import setup

setup(
    name='termcolors',
    description='set terminal colors on the fly',
    author='elmisback',
    packages=['termcolors'],
    entry_points={
        'console_scripts': [
            'termcolors = termcolors.termcolors:cli'
        ]
      },
    package_data={
        'termcolors': ['data/*.colors']
    }
)
