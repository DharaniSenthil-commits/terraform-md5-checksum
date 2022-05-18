import hashlib
import os
import boto3
import sys

AWS_REGION="ap-south-1"

Bucket_Name="tf-md5-checksum"
path="s3://tf-md5-checksum/Data/"
s3_client=boto3.client('s3')
s3 = boto3.resource('s3')
bucket_name = s3.Bucket('tf-md5-checksum')
op_result="fail"
cmd = "aws s3 cp s3://tf-md5-checksum/Input/input.txt index.txt"
os.system(cmd)
input_path="index.txt"
output_path="output.txt"
def uploadfile (output_path):
    
    with open(output_path) as f:
            lines = f.readlines()
            for i in range(len(lines)):
                print(lines[i])

    
def md5_algorithm(file_name):
    md5_hash=hashlib.md5()
    key='Data/'+file_name
    response=s3_client.get_object(Bucket=Bucket_Name,Key=key)
    data=response['Body'].read()
    md5_hash.update(data)
    return md5_hash.hexdigest()

with open(input_path) as f:
    lines=f.readlines()
    for i in range(len(lines)):
        file_path=lines[i].split('|')[0]
        file=file_path.split('/')[-1]
        load_md5_value=lines[i].split('|')[1].strip()
        md5_result=md5_algorithm(file)
        try :
            if load_md5_value == md5_result :
                op_result="pass"
                error_message="No Error"
            else :
                erro_message="Mismatched MD5 VALUE"
        except:
            erro_message=sys.exc_info()[0]    
        
        with open(output_path,'a') as wr:
            wr.write(path+file+"|"+op_result+"|"+error_message+"\n")
            wr.close()
        
uploadfile(output_path)   

cmd = "aws s3 cp  "+output_path+" s3://tf-md5-checksum/Output/output.txt"
os.system(cmd)

