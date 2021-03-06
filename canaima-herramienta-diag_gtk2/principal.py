#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# Esto es Software Libre bajo licencia GPL3
# Autor: Ing. Diego Aguilera
# Yoel Jerez
# Nehomar Barragán 
# http://diegoaguilera.com
#

from gi.repository import Gtk 
#import gtk
import os
import sys
import re
import glib
import time
import MySQLdb
import glob

#import commands
from subprocess import Popen, PIPE
import subprocess

import stat
import md5
import shutil
from time import gmtime, strftime

#~ from hashlib import md5
#~ from os import walk
#~ from os.path import exists

# Prueba de Conexion a la base de datos 

#db = MySQLdb.connect("localhost","root","canaima","dc_ce" )

# prepare a cursor object using cursor() method
#cursor = db.cursor()

# Drop table if it already exist using execute() method.
#cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")

# Create table as per requirement
#sql = """CREATE TABLE EMPLOYEE (
#         FIRST_NAME  CHAR(20) NOT NULL,
#         LAST_NAME  CHAR(20),
#         AGE INT,  
#         SEX CHAR(1),
#         INCOME FLOAT )"""

#cursor.execute(sql)

# disconnect from server
#db.close()



class herramienta_diag:
    def __init__(self):
        #self.wTree = gtk.Builder()
        self.wTree = Gtk.Builder()
        self.wTree.add_from_file("herramienta_diag_gui.glade")
        self.gui()

    def initDb(self):
        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
       
    def gui(self):
        # importamos el archivo glade
        #self.constructor= gtk.Builder()
        self.constructor= Gtk.Builder()
        self.constructor.add_from_file("herramienta_diag_gui.glade")
        self.constructor.connect_signals(self)      
       
        # ventana de inicio de sesion 
        self.inicio_sesion = self.constructor.get_object("inicio_sesion")
        self.text_entry_cedula = self.constructor.get_object("text_entry_cedula")
        self.text_entry_clave = self.constructor.get_object("text_entry_clave")
        #self.boton_aceptar_sesion = self.constructor.get_object("boton_aceptar_sesion")
        self.inicio_sesion.connect ("delete_event", Gtk.main_quit)

        self.window_errores_iniciar_sesion = self.constructor.get_object("window_errores_iniciar_sesion")
        self.window_errores_iniciar_sesion.connect ("delete_event", self.on_hide_window_errores_iniciar_sesion)
        self.label_errores_iniciar_sesion = self.constructor.get_object("label_errores_iniciar_sesion")

        ####datos inicio sesion
        self.entry_inicio_sesion_cedula = self.constructor.get_object("entry_inicio_sesion_cedula")
        self.entry_inicio_sesion_clave = self.constructor.get_object("entry_inicio_sesion_clave")

        
        # ventana principal
        self.ventana = self.constructor.get_object("ventana")
        #self.ventana.connect ("delete_event", gtk.main_quit)
        self.ventana.connect ("delete_event", Gtk.main_quit)
        self.ruta = self.constructor.get_object("ruta")
        self.lista = self.constructor.get_object("lista")
        
        self.boton_consultar = self.constructor.get_object("boton_consultar")
        self.boton_corregir = self.constructor.get_object("boton_corregir")

		#####botones de la ventana consulta####################
        self.ventana_consultas = self.constructor.get_object("ventana_consultas")
        self.ventana_consultas.connect ("delete_event", self.on_hide_ventana_consultas)
        #self.ventana_consultas.connect ("delete_event", Gtk.main_quit)
        #self.consulta_duplicados_eliminados = self.constructor.get.object("consulta_duplicados_eliminados")
        
        #self.boton_nombres_invalidos = self.constructor.get_object("boton_nombres_invalidos")
        #self.boton_formatos_invalidos = self.constructor.get_object("boton_formatos_invalidos")
        #self.boton_duplicados = self.constructor.get_object("boton_duplicados")
        
        self.etiqueta_duplicados = self.constructor.get_object("etiqueta_duplicados")
        self.etiqueta_formatos_invalidos = self.constructor.get_object("etiqueta_formatos_invalidos")
        self.etiqueta_nombres_invalidos = self.constructor.get_object("etiqueta_nombres_invalidos")
        self.barra = self.constructor.get_object("progressbar1")
        
        # ventana del visor de texto
        self.ventana_visor = self.constructor.get_object("ventana_visor")
        self.ventana_visor.connect("delete_event",self.ocultar_visor)
        self.textview = self.constructor.get_object("textview")
        # ventana del filechooser
        self.filechooser = self.constructor.get_object("filechooser")
        #no existe ruta 
        self.window1 = self.constructor.get_object("window1")
        self.window1.connect ("delete_event", self.on_hide_window1)

        self.button_existe = self.constructor.get_object("button_existe")
        #self.ventana.show()
        self.inicio_sesion.show()
        
        #Ventana corregidos
        self.ventana_corregidos = self.constructor.get_object("ventana_corregidos")
        self.ventana_corregidos.connect("delete_event", self.ocultar_ventana_corregidos)

		#Ventana consultar
        self.ventana_consultas = self.constructor.get_object("ventana_consultas")
        #self.ventana_consultas.connect("delete_event", self.ocultar_ventana_consultas)

    def on_hide_ventana_consultas(self, window, event):
        self.ventana_consultas.hide()
        return True

    def on_hide_window1(self, window, event):
        self.window1.hide()
        return True

    def on_hide_window_errores_iniciar_sesion(self, window, event):
        self.window_errores_iniciar_sesion.hide()
        return True

    
    def ocultar_visor(self, window,event):
        self.ventana_visor.hide()
        return True
    
    def ocultar_ventana_corregidos(self, window, event):
        self.ventana_corregidos.hide()
        return True 

	def ocultar_ventana_consultas(self, window, event):
		self.ventana_consultas.hide()
        return True 
                      
    def on_boton_nombres_invalidos_clicked(self, widget):
        self.textview.set_buffer(self.nombres_invalidos)
        self.lista1 ="invalidos"
        #print "lissssta :"+self.lista1
        self.ventana_visor.show()
        
    def on_boton_duplicados_clicked(self, widget):
        self.textview.set_buffer(self.archivos_duplicados)
        self.lista1 ="repetidos"
        #print "lissssta :"+self.lista1
        self.ventana_visor.show()
        
    def on_boton_formatos_invalidos_clicked(self,widget):
        self.textview.set_buffer(self.formatos_invalidos)
        self.lista1 = "formatos"
        #print "lissssta :"+self.lista1
        self.ventana_visor.show()

    def on_boton_aceptar_sesion_clicked(self, widget):
        print "boton_aceptar_sesion"
        errores = self.validar_datos_usuario()

        if len(errores) > 0:
            self.window_errores_iniciar_sesion.show()
            errores_text = ""
            for error in errores:
                errores_text =  errores_text + error +"\n"
            self.label_errores_iniciar_sesion.set_text(errores_text)
        else:
            print "inicio sesion"
            self.ventana.show()
            self.inicio_sesion.hide()
        


    def validar_datos_usuario(self):

        errores = []
        self.cedula = self.entry_inicio_sesion_cedula.get_text()
        self.clave = self.entry_inicio_sesion_clave.get_text()

        self.id_usuario = self.get_idusuario_cedula(self.cedula, self.clave)

        if self.id_usuario == -1:
            errores.append("La cédula o la clave son invalidos. Por favor verifique.")


        #self.activo = True

        # if self.cedula == "":
        #     errores.append("La cédula no puede estar vacia")
        # else:
        #     if not self.cedula.isdigit():
        #         errores.append("La cédula debe ser numérica")
        #     else:
        #         if self.cedula_existe(self.cedula):
        #             print "cedula existe"
        #         else:
        #             errores.append("Cédula o Clave errados, por favor verifique")


        #         if self.clave == "":
        #             errores.append("La clave no puede estar vacia")
        #         else:
        #             if self.clave_existe(self.clave):
        #                 print "clave existe"
        #             else:
        #                 errores.append("Cédula o Clave errados, por favor verifique")

                #if self.activo_existe(self.activo):
                    #print "activo existe"
                #else:
                    #errores.append("Acceso Denegado")
        #else:
        return errores

    def get_idusuario_cedula(self, cedula, clave):

        id_usuario = -1
        #Se crea conexión a db
        #self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        self.initDb()

        self.cursor = self.db.cursor()
        #Se verifica que no existe la cedula
        ver_cedula = ('''SELECT idusuarios FROM usuarios WHERE cedula = %s and clave = %s and activo = 'S'; ''')
        args = (cedula, clave)
        self.cursor.execute(ver_cedula, args)
        row = self.cursor.fetchone()

        if row is not None:         
            id_usuario = row[0]

        #cerrar conexion            
        self.cursor.close()
        self.db.close()

        return id_usuario



    # def cedula_existe(self, cedula):

    #     existe = False
    #     #Se crea conexión a db
    #     #self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
    #     self.initDb()

    #     self.cursor = self.db.cursor()
    #     #Se verifica que existe la cedula
    #     ver_cedula = ('''SELECT cedula FROM usuarios WHERE cedula = %s''')                                 
    #     self.cursor.execute(ver_cedula, cedula)

    #     if self.cursor.fetchone() != None:
    #         existe = True

    #     #cerrar conexion            
    #     self.cursor.close()
    #     self.db.close()

    #     return existe

    # def clave_existe(self, clave):

    #     existe = False
    #     #Se crea conexión a db
    #     #self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
    #     self.initDb()

    #     self.cursor = self.db.cursor()
    #     #Se verifica que existe la clave
    #     ver_clave = ('''SELECT clave FROM usuarios WHERE clave = %s''')                                 
    #     self.cursor.execute(ver_clave, clave)

    #     if self.cursor.fetchone() != None:
    #         existe = True

    #     #cerrar conexion            
    #     self.cursor.close()
    #     self.db.close()

    #     return existe

    #def activo_existe(self, activo):

        #existe = False
        #Se crea conexión a db
        #self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        #self.initDb()

        #self.cursor = self.db.cursor()
        #Se verifica que existe la clave
        #ver_activo = ('''SELECT clave FROM usuarios WHERE activo = S''')                                 
        #self.cursor.execute(ver_activo, activo)

        #if self.cursor.fetchone() != None:
            #existe = True

        #cerrar conexion            
        #self.cursor.close()
        #self.db.close()

        #return existe
        
        
###############consultas###################################
###############consultas###################################
###############consultas###################################
###############consultas################################### 
###############consultas###################################
###############consultas###################################
###############consultas###################################
###############consultas###################################
###############consultas###################################
###############consultas################################### 
###############consultas###################################
###############consultas###################################       

    #def on_boton_consultar_clicked(self, widget):
		#self.ventana_consultas.show()
        #self.textview.set_buffer(self.nombres_invalidos)
        #self.lista1 ="invalidos"
        #print "lissssta :"+self.lista1
        #self.ventana_visor.show()

 
    def on_consulta_duplicados_eliminados_clicked(self, widget):
		print "duplicados eliminados"

		self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
		self.cursor = self.db.cursor()

		query = '''SELECT ad.id_arch_dup, a.nombre_arch, a.ubicacion_arch, ac.id_analisis, 
                    ac.fecha_analisis, ac.hora_analisis, u.cedula, concat(u.nombre,' ',u.apellido)
                    FROM analisis_contenido ac inner join archivo a on ac.id_analisis = a.id_analisis 
                    inner join archivos_duplicados ad on a.id_archivo = ad.id_archivo
                    inner join archivos_duplicados_eliminados ade on ad.id_arch_dup = ade.id_arch_dup
                    inner join usuarios u on u.idusuarios = ac.idusuario'''
				
		#args = (id_analisis_contenido)
		self.cursor.execute(query)
        
		registros = self.cursor.fetchall()
        
		#values = dict()
		self.variable_duplicados_eliminados = Gtk.TextBuffer()
		header = "Id del Archivo Duplicado         -         Nombre del Archivo          -         Ubicacion del Archivo         -         Id del Analisis    - Fecha del Análisis   - Hora del Análisis    - Cédula del analista    -  Nombre y Apellido del Analista\n"
		self.variable_duplicados_eliminados.insert_at_cursor(header)
		self.data_duplicados_eliminados = header
		for row in registros:			
			self.variable_duplicados_eliminados.insert_at_cursor(str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+ "         -         "+(str(row[3]))+ "     -     "+ (str(row[4]))+ "     -   "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"\n")
			self.data_duplicados_eliminados = self.data_duplicados_eliminados + str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+ "         -         "+(str(row[3]))+ "     -     "+ (str(row[4]))+ "     -   "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"\n"

		#cerrar conexion			
		self.cursor.close()
		self.db.close()

		self.consulta = "duplicados_eliminados"
		self.textview.set_buffer(self.variable_duplicados_eliminados)
		self.ventana_visor.show()

    def on_consulta_formatos_corregidos_clicked(self, widget):
		print "formatos corregidos"
		self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
		self.cursor = self.db.cursor()

		query = '''SELECT fi.id_form_inval, a.id_archivo, a.nombre_arch, 
					a.ubicacion_arch, fa.decrip_form_arch, ac.id_analisis,
                    ac.fecha_analisis, ac.hora_analisis, u.cedula, concat(u.nombre,' ',u.apellido)
					FROM analisis_contenido ac 
					inner join archivo a on ac.id_analisis = a.id_analisis  
					inner join formato_archivo fa on a.id_formato_archivo = fa.id_formato_archivo
					inner join formatos_invalidos fi on a.id_archivo = fi.id_archivo
					inner join formatos_corregidos fc on fi.id_form_inval = fc.id_form_inval
                    inner join usuarios u on u.idusuarios = ac.idusuario'''
				
		#args = (id_analisis_contenido)
		self.cursor.execute(query)
        
		registros = self.cursor.fetchall()
        
		#values = dict()
		self.variable_formatos_corregidos = Gtk.TextBuffer()
		header = "Id del Archivo con Formato Invalido         -         Id del Archivo          -         Nombre del Archivo         -         Ubicación del Archivo         -         Tipo del Formato         -         Id del Análisis    - Fecha del Análisis   - Hora del Análisis    - Cédula del analista    -  Nombre y Apellido del Analista\n"
		self.variable_formatos_corregidos.insert_at_cursor(header)		
		self.data_formatos_corregidos = header
		for row in registros:			
			self.variable_formatos_corregidos.insert_at_cursor(str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+"        -        "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"     -       "+(str(row[8]))+"     -     "+(str(row[9]))+"\n")
			self.data_formatos_corregidos = self.data_formatos_corregidos + str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+"        -        "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"     -       "+(str(row[8]))+"     -       "+(str(row[9]))+"\n"

		#cerrar conexion			
		self.cursor.close()
		self.db.close()

		self.consulta = "formatos_corregidos"
		self.textview.set_buffer(self.variable_formatos_corregidos)
		self.ventana_visor.show()
	
    def on_consulta_nombres_corregidos_clicked(self, widget):
		print "nombres corregidos"
		self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
		self.cursor = self.db.cursor()

		query = '''SELECT ni.id_nomb_inval, a.nombre_arch, a.ubicacion_arch, ac.id_analisis, 
                    ac.fecha_analisis, ac.hora_analisis, u.cedula, concat(u.nombre,' ',u.apellido)
					FROM analisis_contenido ac 
					inner join archivo a on ac.id_analisis = a.id_analisis 
					inner join nombres_invalidos ni on a.id_archivo = ni.id_archivo
					inner join nombres_corregidos nc on ni.id_nomb_inval = nc.id_nomb_inval
                    inner join usuarios u on u.idusuarios = ac.idusuario'''
									
		#args = (id_analisis_contenido)
		self.cursor.execute(query)
        
		registros = self.cursor.fetchall()
        
		#values = dict()
		self.variable_nombres_corregidos = Gtk.TextBuffer()
		header = "Id Nombre Invalido        -       Nombre del Archivo         -       Ubicación del Archivo          -         Id del Análisis      -      Fecha    -    Hora     -    Cédula    -    Nombre y Apellido\n"
		self.variable_nombres_corregidos.insert_at_cursor(header)
		self.data_nombres_corregidos = header
		for row in registros:			
			self.variable_nombres_corregidos.insert_at_cursor((str(row[0]))+"        -        "+(str(row[1]))+"        -        "+(str(row[2]))+ "         -         "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"\n")
			self.data_nombres_corregidos = self.data_nombres_corregidos + (str(row[0]))+"        -        "+(str(row[1]))+"        -        "+(str(row[2]))+ "         -         "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"\n"
		#cerrar conexion			
		self.cursor.close()
		self.db.close()

		self.consulta = "nombres_corregidos"
		self.textview.set_buffer(self.variable_nombres_corregidos)
		self.ventana_visor.show()
	

    def on_consulta_archivos_duplicados_clicked(self, widget):
        print "archivos duplicados"

        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        self.cursor = self.db.cursor()

        query = '''SELECT ad.id_arch_dup, a.nombre_arch, a.ubicacion_arch, ac.id_analisis, 
                    ac.fecha_analisis, ac.hora_analisis, u.cedula, concat(u.nombre,' ',u.apellido) 
                    FROM analisis_contenido ac inner join archivo a on ac.id_analisis = a.id_analisis 
                    inner join archivos_duplicados ad on a.id_archivo = ad.id_archivo
                    inner join usuarios u on u.idusuarios = ac.idusuario'''
                    #inner join usuarios usr on usr.id_usuario = ac.id_usuario
                    #where usr.id_usuario = @varglobal

        self.cursor.execute(query)
        
        registros = self.cursor.fetchall()
        
        #values = dict()
        self.variable_duplicados = Gtk.TextBuffer()
        header = " Id del Archivo Duplicado        -         Nombre del Archivo         -         Ubicación del Archivo         -         Id del Análisis      -      Fecha    -    Hora     -    Cédula    -    Nombre y Apellido\n"
        self.variable_duplicados.insert_at_cursor(header)
        self.data_duplicados = header
        for row in registros:           
            self.variable_duplicados.insert_at_cursor(str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+ "         -         "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"\n")
            self.data_duplicados = self.data_duplicados + str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+ "         -         "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"      -      "+(str(row[6]))+"     -     "+(str(row[7]))+"\n"

        #cerrar conexion            
        self.cursor.close()
        self.db.close()

        self.consulta = "archivos_duplicados"
        self.textview.set_buffer(self.variable_duplicados)
        self.ventana_visor.show()



    def on_consulta_formatos_invalidos_clicked(self, widget):
        print "formatos invalidos"

        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        self.cursor = self.db.cursor()

        query = '''SELECT fi.id_form_inval, a.id_archivo, a.nombre_arch, a.ubicacion_arch, fa.decrip_form_arch, ac.id_analisis,
                    ac.fecha_analisis, ac.hora_analisis, u.cedula, concat(u.nombre,' ',u.apellido)
                    FROM analisis_contenido ac inner join archivo a on ac.id_analisis = a.id_analisis 
                    inner join formato_archivo fa on a.id_formato_archivo = fa.id_formato_archivo
                    inner join formatos_invalidos fi on a.id_archivo = fi.id_archivo
                    inner join usuarios u on u.idusuarios = ac.idusuario'''
                    #inner join usuarios usr on usr.id_usuario = ac.id_usuario
                    #where usr.id_usuario = @varglobal

        self.cursor.execute(query)
        
        registros = self.cursor.fetchall()
        
        #values = dict()
        self.variable_formatos_invalidos = Gtk.TextBuffer()
        header = "Id del Formato Invalido         -         Id del Archivo         -         Nombre del Archivo        -        Ubicación del Archivo        -        Tipo del Formato         -         Id del Análisis      -      Fecha    -    Hora     -    Cédula    -    Nombre y Apellido\n"
        self.variable_formatos_invalidos.insert_at_cursor(header)
        self.data_formatos_invalidos = header
        for row in registros:           
            self.variable_formatos_invalidos.insert_at_cursor(str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+"        -        "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"     -     "+(str(row[6]))+"     -     "+(str(row[7]))+"     -       "+(str(row[8]))+"     -     "+(str(row[9]))+"\n")
            self.data_formatos_invalidos = self.data_formatos_invalidos + str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+"        -        "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"     -     "+(str(row[6]))+"     -     "+(str(row[7]))+"     -       "+(str(row[8]))+"     -     "+(str(row[9]))+"\n"
        #cerrar conexion            
        self.cursor.close()
        self.db.close()

        self.consulta = "formatos_invalidos"
        self.textview.set_buffer(self.variable_formatos_invalidos)
        self.ventana_visor.show()

    def on_consulta_nombres_invalidos_clicked(self, widget):
        print "nombres invalidos"

        self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
        self.cursor = self.db.cursor()

        query = '''SELECT ni.id_nomb_inval, a.nombre_arch, a.ubicacion_arch, ac.id_analisis,
                    ac.fecha_analisis, ac.hora_analisis, u.cedula, concat(u.nombre,' ',u.apellido)
                    FROM analisis_contenido ac inner join archivo a on ac.id_analisis = a.id_analisis 
                    inner join nombres_invalidos ni on a.id_archivo = ni.id_archivo
                    inner join usuarios u on u.idusuarios = ac.idusuario'''
                    #inner join usuarios usr on usr.id_usuario = ac.id_usuario
                    #where usr.id_usuario = @varglobal

        self.cursor.execute(query)
        
        registros = self.cursor.fetchall()
        
        #values = dict()
        self.variable_nombres_invalidos = Gtk.TextBuffer()
        header = "Id del Análisis con Nombre Invalido         -         Nombre del Archivo         -         Ubicación del Archivo        -        Id del Análisis      -      Fecha    -    Hora     -    Cédula    -    Nombre y Apellido\n"
        self.variable_nombres_invalidos.insert_at_cursor(header)
        self.data_nombres_invalidos = header
        for row in registros:           
            self.variable_nombres_invalidos.insert_at_cursor(str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+"        -        "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"     -     "+(str(row[6]))+"     -     "+(str(row[7]))+"\n")
            self.data_nombres_invalidos = self.data_nombres_invalidos + str(row[0])+"         -         "+(str(row[1]))+"         -         "+(str(row[2]))+"        -        "+(str(row[3]))+"        -        "+(str(row[4]))+ "         -         "+(str(row[5]))+"     -     "+(str(row[6]))+"     -     "+(str(row[7]))+"\n"
        #cerrar conexion            
        self.cursor.close()
        self.db.close()

        self.consulta = "nombres_invalidos"
        self.textview.set_buffer(self.variable_nombres_invalidos)
        self.ventana_visor.show()


       # self.textview.set_buffer(self.nombres_invalidos)
        #self.lista1 ="invalidos"
        #print "lissssta :"+self.lista1
       # self.ventana_visor.show()
	
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################
######################    fin de consultas    #############################


    def proceso_nombre_invalidos(self, id_analisis_contenido):
        
        # proceso correspondiente a nombres invalidos
        #self.nombres_invalidos = gtk.TextBuffer()
        self.nombres_invalidos = Gtk.TextBuffer()
        query = '''SELECT id_archivo, nombre_arch, ubicacion_arch FROM archivo
                WHERE id_analisis = %s;'''
            
        args = (id_analisis_contenido)
        self.cursor.execute(query, args)
        
        self.data_num_inv = 0
        registros = self.cursor.fetchall()
        for row in registros:
            if row[1].find(' ') > -1:
                add_archivo = ('''INSERT INTO nombres_invalidos
					(id_archivo)
					VALUES (%s)''')
                args = (row[0])
                self.cursor.execute (add_archivo, args)
                self.data_num_inv += 1
                self.nombres_invalidos.insert_at_cursor(os.path.join(row[2], row[1])+"\n")
                
        #self.comando_num_inv = self.data_num_inv
        
        #print "self.comando_num_inv : "+self.comando_num_inv
        #self.data_num_inv = str(os.popen(self.comando_num_inv).read())
        self.etiqueta_nombres_invalidos.set_text(str(self.data_num_inv))
        self.etiqueta_nombres_invalidos.set_visible(True)
        #self.barra.set_fraction(0.33) #progressbar variable
        
        return True

    def proceso_nombre_invalidos_dos(self, id_analisis_contenido):
        # proceso correspondiente a nombres invalidos
        #self.nombres_invalidos = gtk.TextBuffer()
        self.nombres_invalidos = Gtk.TextBuffer()
              
        self.comando_inv = "find "+self.ruta.get_text()+" -name "+"\"* *\""        
        self.data_invlidos = os.popen(self.comando_inv).read()
        
        self.data_num_inv = 0
        #self.nombres_invalidos = gtk.TextBuffer()
        for path, dirs, files in os.walk(self.ruta.get_text()):
            for filename in files:
				#insertar archivos a la tabla
				#TODO: Se debe verificar que el archivo posea una extension de lo contrario de error
				id_formato_archivo = None			
				if filename.find('.') > -1:
				    tipo_formato = filename.split(".")[-1]				    
				    id_formato_archivo = self.get_formato_archivo(tipo_formato)
                    				
				add_archivo = ('''INSERT INTO archivo
				(nombre_arch, ubicacion_arch,id_analisis,id_formato_archivo)
				VALUES (%s,%s,%s,%s)''')				
				args = (filename, path, id_analisis_contenido, id_formato_archivo)
				self.cursor.execute (add_archivo, args)				
				#self.db.commit()
				last_id_archivo = self.get_last_id()
				############################
                #self.barra.pulse()
				if re.search(r' ',filename):
					#insertar a la tabla nombre invalidos.
					add_archivo = ('''INSERT INTO nombres_invalidos
					(id_archivo)
					VALUES (%s)''')					
					args = (last_id_archivo)
					self.cursor.execute (add_archivo, args)
					#####################################
					self.data_num_inv += 1
					self.nombres_invalidos.insert_at_cursor(os.path.join(path, filename)+"\n")
                    
        self.comando_num_inv = "find "+self.ruta.get_text()+" -name "+"\"* *\""+"|wc --lines"
        
        #print "self.comando_num_inv : "+self.comando_num_inv
        self.data_num_inv = str(os.popen(self.comando_num_inv).read())
        self.etiqueta_nombres_invalidos.set_text(str(self.data_num_inv))
        self.etiqueta_nombres_invalidos.set_visible(True)
        #self.barra.set_fraction(0.33) #progressbar variable
	return True 
        
    def proceso_duplicados(self, id_analisis_contenido):
       
       duplicados = self.findDuplicates(self.ruta.get_text())       
       for duplicado in duplicados:
            
           file_arch = duplicado["file"]            
           tamano_arch = duplicado["size"]
           hash_arch = duplicado["hash"]
            
           nombre_arch = file_arch.split("/")[-1]            
           ubicacion_arch = file_arch[:file_arch.find(nombre_arch)]

           id_archivo = self.get_id_archivo(nombre_arch, ubicacion_arch, id_analisis_contenido)
           ##################
           add_archivo = ('''INSERT INTO archivos_duplicados
           (id_archivo, tamano_arch, hash_arch)
            VALUES (%s, %s, %s)''')					
           args = (id_archivo, tamano_arch, hash_arch)
           self.cursor.execute (add_archivo, args)
           #last_id_formatos_invalidos = self.get_last_id()	
           ##########################
            
       self.etiqueta_duplicados.set_text(str(len(duplicados)))
       self.etiqueta_duplicados.set_visible(True)            
        
       return True
        
    def proceso_duplicados_dos(self):
	#self.barra.pulse()
        # proceso correspondiente a archivos duplicados
        #self.archivos_duplicados = gtk.TextBuffer()
        self.archivos_duplicados = Gtk.TextBuffer()
        #####Preparandolo para Ponerlo #######
        
        self.comando_fdupes = "fdupes -rS "+self.ruta.get_text()        
        #self.data_find = os.popen(self.comando_fdupes).read()
        self.data_fdupes = os.popen(self.comando_fdupes).read()
        
        #print self.data_fdupes
        
        self.comando_num_fdupes = "fdupes -rm "+self.ruta.get_text()
        #print "comando: "+self.comando_num_fdupes
        self.data_num_fdupes = str(os.popen(self.comando_num_fdupes).read())
        
        #self.comando_find = "fdupes -rS  "+self.ruta.get_text()
        
        #proceso con expresion regular el número de duplicados:
        self.data_num_fdupes = re.split('\s+',self.data_num_fdupes )[0]
        self.etiqueta_duplicados.set_text(self.data_num_fdupes)
        
        self.etiqueta_duplicados.set_visible(True)
        self.archivos_duplicados.set_text(self.data_fdupes)
        #self.barra.set_fraction(0.66) #progressbar variable
                        
	return True
       
    def proceso_formatos_invalidos(self, id_analisis_contenido):

		# proceso correspondiente a formatos invalidos
		#self.formatos_invalidos = gtk.TextBuffer()
		self.formatos_invalidos = Gtk.TextBuffer()
		#####Preparandolo para Ponerlo #######
		#self.comando_find = "find "+self.ruta.get_text()+" -name "+"*.odt -o -name *.pps -o -name *.doc -o -name *.wma -o -name *.ppt -o -name *.avi -o -name *.wmv -o -name *.xlw -o -name *.wmv -o -name *.mpg -o -name *.mpeg -o -name *.swf -o -name *.mp3"
		self.comando_find = "find "+self.ruta.get_text()+" -type f -name \"*\" "		
        
		#print self.comando_find
		self.data_formatos = os.popen(self.comando_find).read()
		self.data_num_find = 0
		#self.formatos_invalidos= gtk.TextBuffer()
		for path, dirs, files in os.walk(self.ruta.get_text()):			
			for filename in files:
				#Se inserta los archivos encontrados
				#TODO: Se debe verificar que el archivo posea una extension de lo contrario de error
				id_formato_archivo = None			
				if filename.find('.') > -1:
				    tipo_formato = filename.split(".")[-1]				    
				    id_formato_archivo = self.get_formato_archivo(tipo_formato)
                		
				add_archivo = ('''INSERT INTO archivo
				(nombre_arch, ubicacion_arch,id_analisis,id_formato_archivo)
				VALUES (%s,%s,%s,%s)''')				
				args = (filename, path, id_analisis_contenido, id_formato_archivo)
				self.cursor.execute (add_archivo, args)				
				#self.db.commit()
				last_id_archivo = self.get_last_id()				
				###########################
				
				#self.barra.pulse()
				if os.path.splitext(filename)[1] in ('.doc', '.docx', '.xls', '.xlsx', '.xlw', '.ppt', '.pps', '.pptx', '.wma', '.avi', '.wmv' ):
					self.data_num_find += 1				
					self.formatos_invalidos.insert_at_cursor(os.path.join(path, filename)+"\n")
					
					##################
					add_archivo = ('''INSERT INTO formatos_invalidos
					(id_archivo)
					VALUES (%s)''')					
					args = (last_id_archivo)
					self.cursor.execute (add_archivo, args)
					#last_id_formatos_invalidos = self.get_last_id()	
					##########################
					
                    #aqui se asigna  los datos  al buffer
                    #self.formatos_invalidos.set_text(self.data_find)
                    #self.comando_num_find = "find "+self.ruta.get_text()+" -name "+"*.jpg -o -name *.odt"+"|wc --lines"
                    #print "self.comando_num_find : "+self.comando_num_find
                    #self.data_num_find = str(os.popen(self.comando_num_find).read())
                    #print "self.data_num_find:"+self.data_num_find 
                    #aqui se asigna el valor a la etiqueta		
		self.etiqueta_formatos_invalidos.set_text(str(self.data_num_find))
		self.etiqueta_formatos_invalidos.set_visible(True)
		#self.barra.set_fraction(1) #progressbar variable
		return True
	
    def get_last_id(self):
		query = '''SELECT LAST_INSERT_ID();'''				
		self.cursor.execute(query)
		last_id = self.cursor.fetchone()[0]
		#self.db.commit()
		return int(last_id)
        
    def get_id_archivo(self, nombre_arch, ubicacion_arch, id_analisis_contenido):

        if ubicacion_arch[len(ubicacion_arch)-1] == "/":
            ubicacion_arch = ubicacion_arch[:len(ubicacion_arch)-1]        
        query = "SELECT id_archivo FROM archivo WHERE id_analisis = "+str(id_analisis_contenido)+" AND nombre_arch = '"+nombre_arch+"' AND ubicacion_arch REGEXP '"+ubicacion_arch+"/*"+"';"        
        
        self.cursor.execute(query)        
        
        id_archivo = self.cursor.fetchone()
        return id_archivo[0]
	
    def get_formato_archivo(self, tipo_formato):
        
        query = '''SELECT id_formato_archivo
            FROM formato_archivo
            where trim(decrip_form_arch) = %s'''
            
        args = (tipo_formato)
        self.cursor.execute(query, args)
        id_formato = self.cursor.fetchone()[0]
        
        return id_formato
        
		#if tipo_formato == "doc":
			#return 1
		#if tipo_formato == "docx":
			#return 2
		#if tipo_formato == "xls":
			#return 3
		#if tipo_formato == "xlsx":
			#return 4
		#if tipo_formato == "ppt":
			#return 5
		#if tipo_formato == "pptx":
			#return 6
		#if tipo_formato == "odt":
			#return 7
		
    def on_boton_consultar_clicked(self, widget):
		print "consultar"
		self.ventana_consultas.show()

	####def on_boton_##############
		
    def proceso_formatos_corregidos(self, id_analisis_contenido):
		print "proceso_formatos_corregidos"
		
		query = '''SELECT fi.id_form_inval, a.nombre_arch, a.ubicacion_arch, fa.decrip_form_arch
					FROM archivo a inner join formatos_invalidos fi
					on a.id_archivo = fi.id_archivo
					inner join formato_archivo fa on a.id_formato_archivo = fa.id_formato_archivo
					where fa.decrip_form_arch in ("doc", "docx", "xls", "xlsx", "ppt", "pptx")
					and a.id_analisis = %s;'''
				
		args = (id_analisis_contenido)
		self.cursor.execute(query, args)
        
		registros = self.cursor.fetchall()
        
		values = dict()
        
		for row in registros:
			
			ruta_arch = row[2]+"/"+row[1]
			
			self.comando_convertir = self.get_comando_convertir(row[3], row[2]+"/")+" "+ruta_arch
			#print self.comando_convertir
	        #p = Popen(self.comando_convertir, shell=True, stdin=PIPE, stdout=PIPE, stderr=PIPE)
	        #(child_stdin, child_stdout, child_stderr) = (p.stdin, p.stdout, p.stderr)
	        #print "child_stdout "+child_stdout.read()
			p = Popen(self.comando_convertir, shell=True, stdout=PIPE, stderr=subprocess.STDOUT)
			for line in p.stdout.readlines():
				self.archivo_convertido = line.split(" ")[0]
				if self.archivo_convertido == "convert":
					add_archivo = '''INSERT INTO formatos_corregidos
						(id_form_inval)
						VALUES (%s)'''
					args = (row[0])
					self.cursor.execute(add_archivo, args)
					os.popen("rm -f "+ruta_arch).read()
					retval = p.wait()
		return True
	
    def get_comando_convertir(self, tipo_archivo, ruta_archivo):
		
		if tipo_archivo == "doc" or tipo_archivo == "docx":
			tipo = "odt"
		else:
			if tipo_archivo == "xls" or tipo_archivo == "xlsx":
				tipo = "ods"
			else:
				if tipo_archivo == "ppt" or tipo_archivo == "pptx":
					tipo = "odp"
				else:
					tipo = "odt"
					
		comando = "soffice --headless --convert-to "+tipo + " --outdir "+ruta_archivo
		
		return comando
	
    def proceso_nombres_corregidos(self, id_analisis_contenido):
		print "proceso_nombres_corregidos"
		query = '''SELECT ni.id_nomb_inval, a.nombre_arch, a.ubicacion_arch
					FROM archivo a inner join nombres_invalidos ni
					on a.id_archivo = ni.id_archivo
					where a.id_analisis = %s;'''
				
		args = (id_analisis_contenido)
		self.cursor.execute(query, args)
        
		registros = self.cursor.fetchall()
		for row in registros:
			ruta_arch_orig = row[2]+"/"+row[1]
			nombre_corregido = row[1].strip().replace(" ", "-")
			ruta_arch_corr = row[2] +"/"+nombre_corregido
			comando_corregir = "mv -v \""+ruta_arch_orig+"\" "+ruta_arch_corr
			
			arch_corregido = os.popen(comando_corregir).read()	
			if arch_corregido.find("No existe el fichero o el directorio") == -1:
				add_archivo = '''INSERT INTO nombres_corregidos
							(id_nomb_inval)
							VALUES (%s)'''
				args = (row[0])
				self.cursor.execute(add_archivo, args)
		
		return True
	
    def proceso_duplicados_eliminados(self, id_analisis_contenido):
		print "proceso_duplicados_eliminados"
		
		query = '''SELECT ad.id_arch_dup, a.nombre_arch, a.ubicacion_arch
					FROM archivo a inner join archivos_duplicados ad
					on a.id_archivo = ad.id_archivo
					where a.id_analisis = %s;'''
				
		args = (id_analisis_contenido)
		self.cursor.execute(query, args)
        
		registros = self.cursor.fetchall()
		for row in registros:
			ruta_arch = row[2]+"/"+row[1]
			arch_borrado = os.popen("rm -vf \""+ruta_arch+"\"").read()
			if arch_borrado.split(" ")[1].rstrip('\n') == "borrado":
				add_archivo = '''INSERT INTO archivos_duplicados_eliminados
							(id_arch_dup)
							VALUES (%s)'''
				args = (row[0])
				self.cursor.execute(add_archivo, args)
				
		return True
	
    def on_boton_corregir_clicked(self, widget):
		print "corregir"
		self.barra.set_fraction(0.0)
		#Se crea conexión a db
		self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
		self.cursor = self.db.cursor()
		#abrir transaccion db
		self.db.autocommit(False)			
		#self.proceso_nombre_invalidos()
		try:
			if self.proceso_duplicados_eliminados(self.last_id_analisis_contenido):
				if self.proceso_nombres_corregidos(self.last_id_analisis_contenido):
					if self.proceso_formatos_corregidos(self.last_id_analisis_contenido):
						
						self.barra.set_fraction(1)
						self.boton_consultar.set_sensitive(True)
						
			self.db.commit()
		except:
			print("Error inesperado:", sys.exc_info())
			self.db.rollback()
							
		#cerrar transaccion db
		self.db.autocommit(True)
		#cerrar conexion			
		self.cursor.close()
		self.db.close()
		
		self.ventana_corregidos.show()
			

                   
    def on_boton_diagnosticar_clicked(self, widget):
        # Proceso        
        self.barra.set_fraction(0.0)        
        self.comando_cd = "cd "+self.ruta.get_text()               
        self.data_cd=os.path.exists(self.ruta.get_text())        
        print self.data_cd
        if self.data_cd:			
            #Se crea conexión a db
            self.db = MySQLdb.connect("localhost","dc_ce","dc_ce","dc_ce")
            self.cursor = self.db.cursor()
            #abrir transaccion db
            self.db.autocommit(False)			
               #self.proceso_nombre_invalidos()
            try:
                #Se crear un registro en la tabla analisis_contenido
                add_archivo = ('''INSERT INTO analisis_contenido (fecha_analisis, hora_analisis, idusuario) VALUES (CURRENT_DATE(), CURRENT_TIME(), %s)''')

                args = (self.id_usuario)
                self.cursor.execute (add_archivo, args)
                				
                self.last_id_analisis_contenido = self.get_last_id()				

                if self.proceso_formatos_invalidos(self.last_id_analisis_contenido):
                	if self.proceso_nombre_invalidos(self.last_id_analisis_contenido):						    
                	    if self.proceso_duplicados(self.last_id_analisis_contenido):
                			
                	        self.barra.set_fraction(1)
                            ## Falta validar que los buffers no estén vacios para mostrar los botones
                	        #self.boton_nombres_invalidos.set_sensitive(True)
                	        #self.boton_formatos_invalidos.set_sensitive(True)
                	        #self.boton_duplicados.set_sensitive(True)
                	        
                	        #self.boton_consultar.set_sensitive(True)
                	        self.boton_corregir.set_sensitive(True)

                self.db.commit()
            except:
            	print("Error inesperado:", sys.exc_info())
            	self.db.rollback()
            					
            #cerrar transaccion db
            self.db.autocommit(True)
            #cerrar conexion			
            self.cursor.close()
            self.db.close()
        else:
        	self.window1.show()
         
    def on_boton_visor_grabar_clicked(self,widget):
        self.filechooser.show()

    def on_boton_button_existe_clicked(self,widget):
        self.window1.hide()

    def on_boton_aceptar_errores_iniciar_sesion_clicked(self,widget):
        self.window_errores_iniciar_sesion.hide()
    
    def on_boton_aceptar_correcciones_clicked(self,widget):
        self.ventana_corregidos.hide()
        
    def on_boton_filechooser_grabar_clicked(self,widget):
        #funcion grabar del filechooser
        #self.ruta_grabar = str(self.filechooser.get_filename())
        self.ruta_grabar = str(self.filechooser.get_current_folder())
        #self.lista = str(self.lista1)
        #print "lissssta :"+self.lista
        print "ruta a imprimir"+self.ruta_grabar
        self.escribir_archivo(self.consulta, self.ruta_grabar)
    
    def escribir_archivo(self, consulta, ruta):
        #print "funcion para escribir en archivos"
        #print "ruta a usar dentro de la funcion:"+ruta        

        if consulta == "duplicados_eliminados":
        	archivo = open(ruta+"/duplicados_eliminados.txt", 'w')
        	archivo.write(self.data_duplicados_eliminados)
        	archivo.close()
        else:
        	if consulta == "formatos_corregidos":
        		archivo = open(ruta+"/formatos_corregidos.txt", 'w')
        		archivo.write(self.data_formatos_corregidos)
        		archivo.close()
        	else:
        		if consulta == "nombres_corregidos":
        			archivo = open(ruta+"/nombres_corregidos.txt", 'w')
        			archivo.write(self.data_nombres_corregidos)
        			archivo.close()
        		else:
        			if consulta == "archivos_duplicados":
        				archivo = open(ruta+"/archivos_duplicados.txt", 'w')
        				archivo.write(self.data_duplicados)
        				archivo.close()
        			else:
        				if consulta == "formatos_invalidos":
        					archivo = open(ruta+"/formatos_invalidos.txt", 'w')
        					archivo.write(self.data_formatos_invalidos)
        					archivo.close()
        				else:
        					if consulta == "nombres_invalidos":
        						archivo = open(ruta+"/nombres_invalidos.txt", 'w')
        						archivo.write(self.data_nombres_invalidos)
        						archivo.close()
        
        self.filechooser.hide()
        self.ventana_visor.hide()
         

    def on_boton_filechooser_cancelar_clicked(self,widget):
        print "funcion cancelar filechooser"
        self.filechooser.hide()
                  
    def pulse(self):
        print "*********************ejecutando pulse*************"
        #self.barra.pulse()
        self.wTree.get_object("progressbar1").pulse()
        return True
        
    def readfile(self, filename):
        """Read a file and return MD5 hash"""
        
        f = file(filename,'rb');
        #print "\nReading %s \n" % f.name;
        m = md5.new();
        readBytes = 1024; # read 1024 bytes per time
        totalBytes = 0;
        while (readBytes):
            readString = f.read(readBytes);
            m.update(readString);
            readBytes = len(readString);
            totalBytes+=readBytes;
        f.close();
        
        return m.hexdigest()


    def walktree (self, top = ".", depthfirst = True):
        """Returns a list of directories and subdirectories for a specified path"""
        
        names = os.listdir(top)
        if not depthfirst:
            yield top, names
        for name in names:
            try:
                st = os.lstat(os.path.join(top, name))
            except os.error:
                continue
            if stat.S_ISDIR(st.st_mode):
                for (newtop, children) in self.walktree (os.path.join(top, name), depthfirst):
                    #print 'Scanning ', newtop
                    yield newtop, children
        if depthfirst:
            yield top, names
        
    def findDuplicates(self, path):
        """Identifies files as duplicates by comparing size and checksum"""
        sizes = dict()
        hashes = dict()        
        duplicates = []
        
        for (basepath, children) in self.walktree(path,False):
    
            for child in children:
                
                filepath = os.path.join(basepath, child)
                
                if os.path.isfile(filepath):
                    
                    filesize = os.path.getsize(filepath)
                    hash = self.readfile(filepath)
                    
                    if sizes.get(filesize):
                                                                       
                        #print "file:", filepath, " size:", filesize, " file2:", sizes.get(filesize), " hash:", hash
                        
                        if hashes.has_key(hash):
                            #print "duplicates:", hashes[hash], "and", filepath
                            duplicate = dict()
                            
                            duplicate["file"] = filepath
                            duplicate["size"] = filesize
                            duplicate["hash"] = hash
                            
                            duplicates.append(duplicate)
                    else:
                        sizes[filesize] = filepath
                        hashes[hash] = filepath    
        
        return duplicates 
    

    #def done(self, pid, condition, id):
        #print "ejecutando done"
        #glib.source_remove(id)
        #self.barra.set_fraction(1)# progressbar variable
        #text = self.barra.get_text()
	#print "text"+text

    #def run_command(self,comando):
        #pid, stdin, self.stdout, stderr = glib.spawn_async(comando , flags=glib.SPAWN_DO_NOT_REAP_CHILD)
        #id = glib.timeout_add(50, self.pulse)
        #glib.child_watch_add(pid, self.done, id)
    
if __name__ == "__main__":
    print "ejecutando aplicación no como módulo"
    herramienta_diag()    
    #gtk.main()
    Gtk.main()
