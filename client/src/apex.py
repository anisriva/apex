import logging
from sys import exit, platform
import subprocess

token = ''
project = "development"
url = "https://rancher.corp.dev.blu.digicert.com/"
local_port_apex = "8080"
pod_port_apex = "8080"
local_port_db = "1521"
prod_port_db = "1521"
local_port_ssh = "22"
pod_port_ssh = "22"
pod_name = "oracle-apex-0"
namespace = "oracle-apex"
connect_cmd = f'resources/rancher.exe login --token {token} --name {project} {url};\n'
port_forward = f'''resources/rancher.exe kubectl port-forward pod/{pod_name} {local_port_apex}:{pod_port_apex} {local_port_db}:{prod_port_db} {local_port_ssh}:{local_port_ssh} -n {namespace};'''

if platform in ['win32', 'cygwin']:
    print("Windows detected")
elif platform == 'darwin':
    print("macOs detected, not supported yet contact Animesh")
    exit()
elif platform == 'linux':
    print("linux detected, not supported yet contact Animesh")
    exit()
encoding = 'latin1'
print("Opening powershell session")
p = subprocess.Popen('powershell', 
             stdin=subprocess.PIPE,
             stdout=subprocess.PIPE, 
             stderr=subprocess.PIPE,
             shell=True
             )
p.stdin.write(".\\apex.ps1".encode('latin1'))
print(p.stdout.read())

# for cmd in [connect_cmd, port_forward]:
#     print(cmd.encode('latin1'))
#     p.stdin.write(cmd.encode('latin1'))
#     print(p.stdout.read())
#     if cmd == connect_cmd: p.stdin.close()
# p.stdin.close()