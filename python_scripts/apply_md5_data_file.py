import hashlib
import os
def md5_algorithm(path,file):
    md5_hash=hashlib.md5()
    file_read=open(path+file,"rb")
    content=file_read.read()
    md5_hash.update(content)
    md5_value=md5_hash.hexdigest()
    return md5_value

path="python_scripts\test_env\data"
for file in os.listdir(path):
    md5_result=md5_algorithm(path,file)
    delimiter=","
    file_append=open("python_scripts\test_env\input.txt","a")
    Line=[path+file,delimiter,md5_result+"\n"]
    file_append.writelines(Line)
    file_append.close()
