import os
import sys
from components import custominstall

os.system("chmod +x components/minimalinstall.sh")
os.system("chmod +x components/devinstall.sh")
os.system("chmod +x components/musinstall.sh")

os.system('clear')

print("Welcome to Drapliks Config for Niri(DC4N) installer!\n1.Minimal install\n2.Custom install\n3.Exit")
chs = input("> ")

while True:
    if chs == "1":
        os.system("bash components/minimalinstall.sh")
        sys.exit()
    if chs == "2":
        custominstall.installC()
        sys.exit()
    if chs == "3":
        sys.exit()