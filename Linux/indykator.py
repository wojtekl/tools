#!/usr/bin/env python

import os
import signal
import subprocess
from gi.repository import Gtk
from gi.repository import AppIndicator3 as AppIndicator
from gi.repository import Notify

APPINDICATOR_ID = "indykator"

def glowna():
    wlacznik = AppIndicator.Indicator.new(APPINDICATOR_ID, "input_devices_settings", AppIndicator.IndicatorCategory.HARDWARE)
    wlacznik.set_status(AppIndicator.IndicatorStatus.ACTIVE)
    wlacznik.set_menu(lista_stworz())
    Notify.init(APPINDICATOR_ID)
    funkcja_start()
    Gtk.main()

def lista_stworz():
    lista = Gtk.Menu()
    element_panel_dotykowy = Gtk.MenuItem("panel dotykowy")
    element_panel_dotykowy.connect("activate", funkcja_panel_dotykowy)
    lista.append(element_panel_dotykowy)
    element_kamera = Gtk.MenuItem("kamera")
    element_kamera.connect("activate", funkcja_kamera)
    lista.append(element_kamera)
    element_bluetooth = Gtk.MenuItem("bluetooth")
    element_bluetooth.connect("activate", funkcja_bluetooth)
    lista.append(element_bluetooth)
    element_zakoncz = Gtk.MenuItem("zakoncz")
    element_zakoncz.connect("activate", funkcja_zakoncz)
    lista.append(element_zakoncz)
    lista.show_all()
    return lista

def funkcja_panel_dotykowy(_):
    plik = open(os.path.abspath(__file__), "r+")
    tresc = plik.readlines()
    for i, linia in enumerate(tresc) :
        if tresc[i].startswith("# panel-dotykowy ") :
            pola = tresc[i].split()
            if "0" == pola[2] :
                tresc[i] = "# panel-dotykowy 1\n"
                os.system("synclient TouchpadOff=0")
            else:
                tresc[i] = "# panel-dotykowy 0\n"
                os.system("synclient TouchpadOff=1")
    plik.seek(0)
    plik.writelines(tresc)
    plik.close

def funkcja_kamera(_):
    plik = open(os.path.abspath(__file__), "r+")
    tresc = plik.readlines()
    for i, linia in enumerate(tresc) :
        if tresc[i].startswith("# kamera ") :
            pola = tresc[i].split()
            if "0" == pola[2] :
                tresc[i] = "# kamera 1\n"
                os.system("sudo -u administrator modprobe -r uvcvideo")
            else:
                tresc[i] = "# kamera 0\n"
                os.system("sudo -u administrator modprobe uvcvideo")
    plik.seek(0)
    plik.writelines(tresc)
    plik.close

def funkcja_bluetooth(_):
	os.system("pactl load-module module-bluetooth-discover")


def funkcja_zakoncz(_):
    Notify.uninit()
    Gtk.main_quit()

def funkcja_start():
    plik = open(os.path.abspath(__file__), "r")
    tresc = plik.readlines()
    for linia in tresc :
# panel-dotykowy 0
        if linia.startswith("# panel-dotykowy ") :
            pola = linia.split()
            if "0" == pola[2] :
                os.system("synclient TouchpadOff=1")
            else:
                os.system("synclient TouchpadOff=0")
# kamera 1
        if linia.startswith("# kamera ") :
            pola = linia.split()
            if "0" == pola[2] :
                os.system("xinput disable 10")
            else:
                os.system("xinput enable 10")
    plik.close()

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    glowna()
