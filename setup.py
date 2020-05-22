#!/usr/bin/env python

import os
import sys

from setuptools import setup, find_packages
from setuptools import Extension


os.chdir(os.path.dirname(sys.argv[0]) or ".")

setup(
    name="pygohcl",
    use_scm_version=True,
    description="Python bindings for Hashicorp HCL2 Go library",
    long_description=open("README.md", "rt").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/Scalr/pygohcl",
    author="Lee Archer",
    author_email="l.archer@scalr.com",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "License :: OSI Approved :: MIT License",
    ],
    packages=find_packages(),
    install_requires=["cffi>=1.0.0"],
    setup_requires=["cffi>=1.0.0", "setuptools-golang", "setuptools_scm"],
    build_golang={"root": "github.com/Scalr/pygohcl"},
    ext_modules=[Extension("pygohcl", ["pygohcl.go"])],
    cffi_modules=["pygohcl/build_cffi.py:ffi",],
)
