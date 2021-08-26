import subprocess
import pandas as pd

## sinfo
def py_sinfo():
    sinfo = subprocess.run(["sinfo", "-l"], stdout = subprocess.PIPE) ## binary string
    # print(sinfo.stdout.decode("ascii"))
    sinfo = sinfo.stdout.decode("ascii").split("\n")
    time = sinfo[0]
    out_length = len(sinfo[:-1])
    pd_sinfo = []
    
    for i in range(1, out_length):
      pd_sinfo.append(sinfo[i].split())
      
    pd_sinfo = pd.DataFrame(pd_sinfo)
    header = pd_sinfo.iloc[0]
    sinfo = pd.DataFrame(pd_sinfo.values[1:], columns = header)
    return sinfo

## sjob (based on `sacct`)
def py_job(username:str):
  sjob = subprocess.run(["sacct", "-u", "{}".format(username)], stdout = subprocess.PIPE) # getpass.getuser() -> get username from bash (import getpass)
  sjob = sjob.stdout.decode("ascii").split("\n")
  out_length = (sjob[:-1])
  pd_sjob = []
  for i in range(0, len(out_length)):
    pd_sjob.append(sjob[i].split())
  
  pd_sjob = pd.DataFrame(pd_sjob)
  header = pd_sjob.iloc[0]
  pd_sjob = pd.DataFrame(pd_sjob.values[1:], columns = header)
  
if "__name__" == __main__:
  sinfo = py_sinfo()
  print("sinfo:\n", sinfo)
  sjob = ("sjob", py_job("terencelau"))
  print("your tasks/jobs:\n", sjob)
