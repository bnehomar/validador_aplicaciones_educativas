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
        self.window_incluir_usuario.connect ("delete_event", self.on_hide_window_incluir_usuario)

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

        self.window_usuario_incluido = self.constructor.get_object("window_usuario_incluido")
        self.window_errores_incluir_usuario = self.constructor.get_object("window_errores_incluir_usuario")
        self.label_errores_insertar_usuario = self.constructor.get_object("label_errores_insertar_usuario")
        self.boton_aceptar_errores_incluir_usuario = self.constructor.get_object("boton_aceptar_errores_incluir_usuario")

        #self.boton_aceptar_incluir_usuario = self.constructor.get_object("boton_aceptar_incluir_usuario")

        self.window_cedula_modificar_usuario = self.constructor.get_object("window_cedula_modificar_usuario")
        self.window_cedula_modificar_usuario.connect ("delete_event", self.on_hide_window_cedula_modificar_usuario)

        self.entry_cedula_modificar = self.constructor.get_object("entry_cedula_modificar")

        self.window_cedula_no_existe = self.constructor.get_object("window_cedula_no_existe")

        #Modificar usuario
        self.window_modificar_usuario = self.constructor.get_object("window_modificar_usuario")
        self.window_modificar_usuario.connect ("delete_event", self.on_hide_window_modificar_usuario)
        #Datos del usuario
        self.entry_modificar_nombre = self.constructor.get_object("entry_modificar_nombre")
        self.entry_modificar_apellido = self.constructor.get_object("entry_modificar_apellido")
        self.entry_modificar_cedula = self.constructor.get_object("entry_modificar_cedula")
        self.entry_modificar_clave = self.constructor.get_object("entry_modificar_clave")

        # the combobox
        self.combobox_activar_modificar_usuario = self.constructor.get_object("combobox_activar_modificar_usuario")
        self.combobox_activar_modificar_usuario.set_model(self.liststore_usuario_activo)
        self.cell = Gtk.CellRendererText()
        self.combobox_activar_modificar_usuario.pack_start(self.cell, True)
        self.combobox_activar_modificar_usuario.add_attribute(self.cell, 'text', 1)

        self.window_usuario_modificado = self.constructor.get_object("window_usuario_modificado")

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

    def on_hide_window_incluir_usuario(self, window, event):
    	self.window_incluir_usuario.hide()
    	return True

    def on_hide_window_cedula_modificar_usuario(self, window, event):
    	self.window_cedula_modificar_usuario.hide()
    	return True

    def on_hide_window_modificar_usuario(self, window, event):
    	self.window_modificar_usuario.hide()
    	return True

    def on_boton_aceptar_incluir_usuario_clicked(self, widget):
		print "boton_aceptar_incluir_usuario"
		errores = self.validar_datos_usuario()

		if len(errores) > 0:
			self.window_errores_incluir_usuario.show()
			errores_text = ""
			for error in errores:
				errores_text =  errores_text + error +"\n"
			self.label_errores_insertar_usuario.set_text(errores_text)
		else:
			print "Insertar"
			self.insertar_usuario()


    def validar_datos_usuario(self):

    	errores = []
    	self.nombre = self.entry_incluir_nombre.get_text()
        self.apellido = self.entry_incluir_apellido.get_text()
        self.cedula = self.entry_incluir_cedula.get_text()
        self.clave = self.entry_incluir_clave.get_text()
        self.activo = self.item

        if self.nombre == "":
        	errores.append("El nombre no puede ser vacio")
        if self.apellido == "":
        	errores.append("El apellido no puede ser vacio")
        if self.cedula == "":
        	errores.append("La cédula no puede ser vacia")
        else:
        	if not self.cedula.isdigit():
        		errores.append("La cédula debe ser numérica")
        	else:
        		if self.cedula_existe(self.cedula):
        			errores.append("La cédula ya existe. Coloque otra.")
        if self.clave == "":
        	errores.append("La clave no puede ser vacia")

    	return errores

    def cedula_existe(self, cedula):

    	existe = False
    	#Se crea conexión a db
        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        self.cursor = self.db.cursor()
        #Se verifica que no existe la cedula
        ver_cedula = ('''SELECT cedula FROM usuarios WHERE cedula = %s''')                                 
        self.cursor.execute(ver_cedula, cedula)

        if self.cursor.fetchone() != None:
        	existe = True

        #cerrar conexion			
        self.cursor.close()
        self.db.close()

        return existe

    def insertar_usuario(self):
    	#Se crea conexión a db
        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")

        if self.activo == "No":
        	act = "N"
        else:
        	if self.activo == "Si":
        		act = "S"

        try:
            self.cursor = self.db.cursor()
	         
	        #Se crear un registro en la tabla usuarios
            add_usuario = (''' INSERT INTO usuarios
            (nombre, apellido, cedula, clave, activo)
            VALUES (%s, %s, %s, %s, %s) ''')
            args = (self.nombre, self.apellido, self.cedula, self.clave, act)
            self.cursor.execute (add_usuario, args)
            self.db.commit()
            print "usuario ingresado"
            self.window_usuario_incluido.show()
        except:
            print("Error inesperado:", sys.exc_info())
            self.db.rollback()
        #cerrar conexion			
        self.cursor.close()
        self.db.close()

    def on_button_aceptar_usuario_incluido_clicked(self, widget):
    	self.entry_incluir_nombre.set_text("")
        self.entry_incluir_apellido.set_text("")
        self.entry_incluir_cedula.set_text("")
        self.entry_incluir_clave.set_text("")
        self.combobox_activar_usuario.set_active(0)
        self.window_usuario_incluido.hide()

    def on_boton_aceptar_errores_incluir_usuario_clicked(self, widget):
    	self.window_errores_incluir_usuario.hide()

    def on_boton_modificar_usuario_clicked(self, widget):
    	self.entry_cedula_modificar.set_text("")
    	self.window_cedula_modificar_usuario.show()

    def on_button_aceptar_cedula_no_existe_clicked(self, widget):
    	self.window_cedula_no_existe.hide()
    	self.entry_cedula_modificar.set_text("")

    def on_button_aceptar_cedula_modificar_clicked(self, widget):
    	cedula = self.entry_cedula_modificar.get_text()
    	
    	usuario = self.get_cedula(cedula)

    	if len(usuario) > 0:
    		self.set_modificar_usuario(usuario)
    		self.window_cedula_modificar_usuario.hide()
    	else:
    		self.window_cedula_no_existe.show()

    def get_cedula(self, cedula):

    	usuario = dict()
    	#Se crea conexión a db
        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        self.cursor = self.db.cursor()
        #Se verifica que no existe la cedula
        ver_cedula = ('''SELECT idusuarios, nombre, apellido, clave, activo FROM usuarios WHERE cedula = %s''')                                 
        self.cursor.execute(ver_cedula, cedula)
        row = self.cursor.fetchone()

        if row is not None:        	

        	usuario["idusuarios"] = row[0]
        	usuario["nombre"] = row[1]
        	usuario["apellido"] = row[2]
        	usuario["clave"] = row[3]
        	usuario["activo"] = row[4]
        	usuario["cedula"] = cedula

        #cerrar conexion			
        self.cursor.close()
        self.db.close()

        return usuario

    def set_modificar_usuario(self, usuario):
    	print "modificar_usuario"    	
    	self.entry_modificar_nombre.set_text(usuario["nombre"])
        self.entry_modificar_apellido.set_text(usuario["apellido"])
        self.entry_modificar_cedula.set_text(usuario["cedula"])
        self.entry_modificar_clave.set_text(usuario["clave"])

        self.idusuarios = usuario["idusuarios"]

        if usuario["activo"] == "N":
        	index = 0
        else:
        	if usuario["activo"] == "S":
        		index = 1

        self.combobox_activar_modificar_usuario.set_active(index)

    	self.window_modificar_usuario.show()

    def on_boton_aceptar_usuario_modificar_clicked(self, widget):
		print "on_boton_aceptar_usuario_modificar_clicked"
		errores = self.validar_datos_usuario_modifcar()

		if len(errores) > 0:
			self.window_errores_incluir_usuario.show()
			errores_text = ""
			for error in errores:
				errores_text =  errores_text + error +"\n"
			self.label_errores_insertar_usuario.set_text(errores_text)
		else:
			print "modificar"
			self.modificar_usuario()


    def validar_datos_usuario_modifcar(self):

    	errores = []

    	self.nombre = self.entry_modificar_nombre.get_text()
        self.apellido = self.entry_modificar_apellido.get_text()
        self.cedula =self.entry_modificar_cedula.get_text()
        self.clave = self.entry_modificar_clave.get_text()
        self.activo = self.item

        if self.nombre == "":
        	errores.append("El nombre no puede ser vacio")
        if self.apellido == "":
        	errores.append("El apellido no puede ser vacio")
        if self.cedula == "":
        	errores.append("La cédula no puede ser vacia")
        else:
        	if not self.cedula.isdigit():
        		errores.append("La cédula debe ser numérica")
        if self.clave == "":
        	errores.append("La clave no puede ser vacia")

    	return errores

    def modificar_usuario(self):
    	#Se crea conexión a db
        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")

        if self.activo == "No":
        	act = "N"
        else:
        	if self.activo == "Si":
        		act = "S"

        try:
            self.cursor = self.db.cursor()
	         
	        #Se actualiza un registro en la tabla usuarios
            upd_usuario = ('''UPDATE usuarios 
            	SET nombre=%s, apellido=%s, cedula=%s, clave=%s, activo=%s 
            	WHERE idusuarios=%s;''')

            args = (self.nombre, self.apellido, self.cedula, self.clave, act, self.idusuarios)
            self.cursor.execute (upd_usuario, args)
            self.db.commit()
            print "usuario modificado"
            self.window_usuario_modificado.show()
        except:
            print("Error inesperado:", sys.exc_info())
            self.db.rollback()
        #cerrar conexion			
        self.cursor.close()
        self.db.close()

    def on_button_usuario_modificado_clicked(self, widget):
        self.window_usuario_modificado.hide()
        self.window_modificar_usuario.hide()
    	

if __name__ == '__main__':
    p = Proceso_usuarios() 
    Gtk.main()
         
       
