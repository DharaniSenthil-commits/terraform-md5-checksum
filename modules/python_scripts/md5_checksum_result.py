import hashlib
import os
def md5_algorithm(path,file):
    md5_hash=hashlib.md5()
    file_read=open(path+file,"rb")
    content=file_read.read()
    md5_hash.update(content)
    md5_value=md5_hash.hexdigest()
    return md5_value

input_path="python_scripts\test_env\input.txt"
output_path="python_scripts\test_env\output.txt"
with open(input_path) as f:
    lines=f.readlines()
    for i in range(len(lines)):
        file_path=lines[i].split(',')[0]
        load_md5_value=lines[i].split(',')[1].strip()
        test_md5_value=md5_algorithm(file_path)
        if load_md5_value == test_md5_value :
            op_result="pass"
        else :
            op_result="fail"
        
        write_result=open(output_path,"w")
        write_result.write(result[0]+","+result[1])


'''key='/Output/output.txt'
s3_client.upload_file(output_path, Bucket_Name, key)
'''    
    