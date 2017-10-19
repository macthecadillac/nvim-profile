#!/usr/bin/env python
from filter import find_proj_root
import os
import sys
import subprocess


curr_dir = sys.argv[1]
proj_root = find_proj_root(curr_dir)
os.chdir(proj_root)
subprocess.Popen(['ctags', '-R', '-h', '[".py"]',
                  '--exclude={.git,__pycache__,__init__.py}'])
