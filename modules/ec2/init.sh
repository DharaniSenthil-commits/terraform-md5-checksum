#!/bin/bash -xe
aws s3 cp s3://tf-md5-checksum/requirement.txt requirement.txt
pip3 install -r requirement.txt
aws s3 cp s3://tf-md5-checksum/python_scripts/md5_checksum.py md5_checksum.py
python3 md5_checksum.py


