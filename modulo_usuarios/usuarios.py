#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  sin título.py
#  
#  Copyright 2015 Nehomar Barragán <nehomarb@canaima-n3h0>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
from gi.repository import Gtk 
import os
import sys
import re
import glib
import time
import MySQLdb
import glob

import stat
import md5
import shutil


class Proceso_usuarios():
    
    def __init__(self):       
        self.wTree = Gtk.Builder()
        self.wTree.add_from_file("modulo_usuario_gui.glade")
        self.inicializar_ventanas_glade()
    
    def inicializar_ventanas_glade(self):
    	self.constructor= Gtk.Builder()
        self.constructor.add_from_file("modulo_usuario_gui.glade")
        self.constructor.connect_signals(self)
        # ventana principal
        self.window_menu_usuario = self.constructor.get_object("window_menu_usuario")
        #self.ventana.connect ("delete_event", gtk.main_quit)
        self.window_menu_usuario.connect ("delete_event", Gtk.main_quit)

        self.window_incluir_usuario = self.constructor.get_object("window_incluir_usuario")

        #Datos del usuario
        self.entry_incluir_nombre = self.constructor.get_object("entry_incluir_nombre")
        self.entry_incluir_apellido = self.constructor.get_object("entry_incluir_apellido")
        self.entry_incluir_cedula = self.constructor.get_object("entry_incluir_cedula")
        self.entry_incluir_clave = self.constructor.get_object("entry_incluir_clave")
        
        # the liststore
        self.liststore_usuario_activo = Gtk.ListStore(int,str)
        self.liststore_usuario_activo.append([0,"No"])
        self.liststore_usuario_activo.append([1,"Si"])

        # the combobox
        self.combobox_activar_usuario = self.constructor.get_object("combobox_activar_usuario")
        self.combobox_activar_usuario.set_model(self.liststore_usuario_activo)
        self.cell = Gtk.CellRendererText()
        self.combobox_activar_usuario.pack_start(self.cell, True)
        self.combobox_activar_usuario.add_attribute(self.cell, 'text', 1)
        self.combobox_activar_usuario.set_active(0)

        #self.boton_aceptar_incluir_usuario = self.constructor.get_object("boton_aceptar_incluir_usuario")

        self.window_menu_usuario.show()

    def on_combobox_activar_usuario_changed(self, widget, data=None):
        self.index = widget.get_active()
        self.model = widget.get_model()
        self.item = self.model[self.index][1]
        #print "ComboBox Active Text is", self.item
        #print "ComboBox Active Index is", self.index

    def on_boton_incluir_usuarios_clicked(self, widget):
    	print "on_boton_incluir_usuarios_clicked"

    	self.window_incluir_usuario.show()

    def on_boton_aceptar_incluir_usuario_clicked(self, widget):
    	print "boton_aceptar_incluir_usuario"
    	self.validar_datos_usuario()

    def validar_datos_usuario(self):

    	errores = []
    	nombre = self.entry_incluir_nombre.get_text()
        apellido = self.entry_incluir_apellido.get_text()
        cedula = self.entry_incluir_cedula.get_text()
        clave = self.entry_incluir_clave.get_text()
        activo = self.item

        if (nombre == ""):
        	print ""

    	return True

    def insertar_usuario(self):
    	#Se crea conexión a db
        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")

        nombre = str(raw_input('Ingrese su Nombre: '))
        if nombre != "":
            apellido = str(raw_input('Ingrese su Apellido: '))
            if apellido != "":
                cedula = str(raw_input('Ingrese su Cédula: '))
                if cedula != "":
                    if cedula.isdigit(): 
                        clave = str(raw_input('Ingrese una clave: '))
                        if clave != "":
                          
                            try:
                                self.cursor = self.db.cursor()
                            #abrir transaccion db
                                self.db.autocommit(False)
                            #Se verifica que no existe la cedula
                                ver_cedula = ('''SELECT cedula FROM usuarios WHERE cedula = %s''')

                                #if(mysql_num_rows(ver_cedula)>0)                                    
                                self.cursor.execute(ver_cedula, cedula) 
                                resultado=self.cursor.fetchall()
                                  
                            #Se crear un registro en la tabla usuarios
                                add_usuario = (''' INSERT INTO usuarios
                                (nombre, apellido, cedula, clave)
                                VALUES (%s, %s, %s, %s) ''')
                                args = (nombre, apellido, cedula, clave)
                                self.cursor.execute (add_usuario, args)
                                self.db.commit()
                                print "usuario ingresado"
                            except:
                                print("Error inesperado:", sys.exc_info())
                                self.db.rollback()
                                
                            #cerrar transaccion db
                            self.db.autocommit(True)
                            #cerrar conexion			
                            self.cursor.close()
                        else:
                            print("definir una clave es obligatorio\n")
                    else:
        
                        print("Error en la cédula, ingrese solo números\n")
                else:
        
                    print("Ingresar la cedúla es obligatorio\n")
            else:
        
                print("Ingresar el apellido es obligatorio\n")
        else:
            print("Ingresar el nombre es obligatorio\n")

        self.db.close()

if __name__ == '__main__':
    p = Proceso_usuarios() 
    Gtk.main()
         
       
