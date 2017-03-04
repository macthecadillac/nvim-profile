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
            proj_root = ''.join(re.findall(r'(\/[\w ]+)', proj_root)[:-1])
            if len(proj_root) == 0:
                raise IOError
    return proj_root


def choose_env_from_ext(ext):
    # Look for .env in curr dir
    if os.path.isfile(curr_dir + '/.env'):
        with open(curr_dir + '/.env') as p:
            return p.read()[:-1] + ' '
    else:
        try:
            proj_root = find_proj_root()
            # Find .env in project root directory
            if os.path.isfile(proj_root + '/.env'):
                with open(proj_root + '/.env') as p:
                    return p.read()[:-1] + ' '
            else:
                return envs[ext]
        except IOError:
            return envs[ext]
        except KeyError:
            return envs[ext]


def set_env():
    with open('./' + fname) as f:
        shebang = f.readlines()[0][:-1]

    if shebang[:2] == "#!":
        env = ''
        st = os.stat('./' + fname)
        os.chmod('./' + fname, st.st_mode | stat.S_IEXEC)
    else:
        try:
            ext = re.search(r'(\.[\w]+\b)', fname).groups()[0]
        except AttributeError:
            sys.exit()
        if ext in envs:
            env = choose_env_from_ext(ext)
    return env


def compose_cmd(env):
    if ext == '.rs':
        script_content = 'cargo run\n'
    else:
        script_content = env + './' + fname + '\n'
    return script_content


def write_script(script_content):
    with open('/tmp/run', 'w') as cmd:
        cmd.write('#!/bin/bash\n')
        cmd.write('cd ' + curr_dir.replace(' ', '\ ') + '\n')
        cmd.writelines(script_content)
    st = os.stat('/tmp/run')
    os.chmod('/tmp/run', st.st_mode | stat.S_IEXEC)


def execute():
    if in_term:
        exttools_dir = os.getenv('HOME') + '/.config/nvim/plugin/external-tools.vim/'
        term_title = 'Execute: ' + fname
        subprocess.Popen([exttools_dir + 'open-term.sh', term_title,
                          '{}/{}'.format(curr_dir, fname)])
    else:
        subprocess.Popen(['/tmp/run'])


envs = {
    '.py': '/usr/bin/python3 ',
    '.jl': '/usr/bin/env julia ',
    '.sh': '/usr/bin/bash'
}

fname = sys.argv[1]
curr_dir = sys.argv[2]
ext = ''
in_term = False
try:
    if sys.argv[3] == '--term':
        in_term = True
except IndexError:
    pass


if __name__ == '__main__':
    env = set_env()
    script_content = compose_cmd(env)
    write_script(script_content)
    execute()
