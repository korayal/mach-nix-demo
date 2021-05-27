from setuptools import setup, find_packages

setup(
    name='sample-project',
    version='0.0.0',
    packages=find_packages(),
    install_requires=[
        "setuptools-scm == 3.2.0",
        "numpy == 1.16.0"
    ],
)
