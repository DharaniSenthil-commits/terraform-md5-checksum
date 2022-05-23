import chunk
import hashlib
import os
import boto3
import sys

AWS_REGION="ap-south-1"


path="s3://tf-bt-md5-checksum/Data/"
s3_client=boto3.client('s3')

def md5_algorithm(file_name):
    md5_hash=hashlib.md5()
    key='Data/'+file_name
    response=s3_client.get_object(Bucket='tf-bt-md5-checksum',Key=key)
    data=response['Body'].read()
    md5_hash.update(data)
    return md5_hash.hexdigest()
print("starts")
s3 = boto3.resource('s3')
bucket_name = s3.Bucket('tf-bt-md5-checksum')

for object_summary in bucket_name.objects.filter(Prefix="Data/"):
    value=object_summary.key
    file=value.split('/')[-1]
    if file == "" :
        continue
    md5_result=md5_algorithm(file)
    delimiter=","
    Line=[path+file,delimiter,md5_result+"\n"]
    s3_client.put_object(Body=Line,Bucket='tf-bt-md5-checksum',Key='Input/input.txt')
 
