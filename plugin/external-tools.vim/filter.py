#!/usr/bin/env python
import subprocess
import sys
import re
import os
import stat


def find_proj_root():
    proj_root = curr_dir
    while True:
        if os.path.isdir(proj_root + '/.git'):
            break
        else:
            # Search for the .git folder up the directory tree
            proj_root = ''.join(re.findall(r'(\/[\w]+)', proj_root)[:-1])
            if len(proj_root) == 0:
                raise Exception
    return proj_root


def choose_env_from_ext():
    if os.path.isfile(curr_dir + '/.env'):      # Look for .env in curr dir
        with open(curr_dir + '/.env') as p:
            env = p.read()[:-1] + ' '
    else:
        try:
            proj_root = find_proj_root()
            # Find .env in project root directory
            if os.path.isfile(proj_root + '/.env'):
                with open(proj_root + '/.env') as p:
                    env = p.read()[:-1] + ' '
            else:
                # If none is found in root, use default interpreter
                env = envs[ext]
        except:
            # If no root directory found, use default interpreter
            env = envs[ext]
    return env


# Set up the environment
envs = {
    '.py': '/usr/bin/python3 ',
    '.jl': '/usr/bin/env julia ',
    '.sh': '/usr/bin/bash'
}

fname = sys.argv[1]
curr_dir = sys.argv[2]
ext = ''

# Filter file types
with open('./' + fname) as f:
    shebang = f.readlines()[0][:-1]

if shebang[:2] == "#!":
    env = ''
    st = os.stat('./' + fname)
    os.chmod('./' + fname, st.st_mode | stat.S_IEXEC)    # Make executable
else:
    try:
        ext = re.search(r'(\.[\w]+\b)', fname).groups()[0]
    except:
        sys.exit()
    if ext in envs:
        env = choose_env_from_ext()

# Choose the right runtime/compiler
if ext == '.rs':
    run_script = 'cargo run\n'
else:
    run_script = env + fname + '\n'

# Create a shell script in the /tmp directory
with open('/tmp/run', 'w') as cmd:
    cmd.write('#!/bin/bash\n')
    cmd.write('cd ' + curr_dir + '\n')
    cmd.writelines(run_script)
subprocess.Popen(['chmod', '+x', '/tmp/run']).wait()

# Execute the script through a wrapper script
exttools_dir = os.getenv('HOME') + '/.vim/plugin/external-tools.vim/'
term_title = 'Execute: ' + fname
subprocess.Popen([exttools_dir + 'open-term.sh', term_title])
