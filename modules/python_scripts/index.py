import hashlib
import os
def md5_algorithm(file):
    md5_hash=hashlib.md5()
    delim="\\"
    file_read=open(path+delim+file,"rb")
    content=file_read.read()
    md5_hash.update(content)
    md5_value=md5_hash.hexdigest()
    return md5_value

path = r'C:\Users\DELL-PC\Downloads\terraform-md5-checksum\modules\python_scripts\test_env\data'
s3_path="s3://tf-bt-md5-checksum/Data/"
for file in os.listdir(path):
    md5_result=md5_algorithm(file)
    delimiter="|"
    file_append=open(r'C:\Users\DELL-PC\Downloads\terraform-md5-checksum\modules\python_scripts\input.txt',"a")
    Line=s3_path+file,delimiter,md5_result,delimiter+"\n"
    file_append.writelines(Line)
    file_append.close()