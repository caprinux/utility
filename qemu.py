#!/usr/bin/python3
import argparse
import sys
from subprocess import check_call
import magic
import os


class ArgumentParser(argparse.ArgumentParser):
    def error(self, message):
        self.print_help(sys.stderr)
        sys.stderr.write('error: %s\n' % message)
        exit()


parser = ArgumentParser()
parser.add_argument("-d", "--debug", help="connect gdb in split",
                    action="store_true")
parser.add_argument('file', nargs=1)
args = parser.parse_args()


if not os.path.isfile(args.file[0]):
    print("File does not exist.")
    exit()

elfinfo = magic.from_file(args.file[0]).split(", ")

if "ELF" not in elfinfo[0]:
    print("File is not a valid ELF.")
    exit()

arch = elfinfo[1]
PORT = '12345'
SOLIB = 'set solib-search-path'

if arch == "MIPS":
    LIB = '/usr/mipsel-linux-gnu'
    if args.debug:
        check_call(['remotinator', 'vsplit', '-x',
                    f'gef {args.file[0]} -q --eval-command=\'target remote localhost:{PORT}\' --eval-command=\'{SOLIB} {LIB}/lib/\''])
        check_call(['qemu-mipsel-static', '-L', LIB, '-g', PORT, args.file[0]])
    else:
        check_call(['qemu-mipsel-static', '-L', LIB, args.file[0]])

elif arch == "ARM":
    LIB = '/usr/arm-linux-gnueabi'
    if args.debug:
        check_call(['remotinator', 'vsplit', '-x',
                    f'gef {args.file[0]} -q --eval-command=\'target remote localhost:{PORT}\' --eval-command=\'{SOLIB} {LIB}/lib/\''])
        check_call(['qemu-arm-static', '-L', LIB, '-g', PORT, args.file[0]])
    else:
        check_call(['qemu-arm-static', '-L', LIB, args.file[0]])

else:
    print(f"{arch} is not supported yet.")
    exit()
