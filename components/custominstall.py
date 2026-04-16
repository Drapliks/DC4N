import os
import sys

def installC():
    os.system("clear")
    print("Do you need install a base installation?\n(y/n)")
    baseI = input(">> ")
    print("Do you need install a dev packages?\nUnityHub and other (y/n)")
    devI = input(">> ")
    print("Do you need install a music packages?\nYandex Music and other (y/n)")
    musI = input(">> ")
    if baseI == "y":
        os.system("bash minimalinstall.sh")
    if devI == "y":
        os.system("bash devinstall.sh")
    if musI == "y":
        os.system("bash musinstall.sh")
    os.system("clear")
    print("Install is end.")