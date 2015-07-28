#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# Esto es Software Libre bajo licencia GPL3
# Autor: Ing. Diego Aguilera
# http://diegoaguilera.com
#
import gtk
import os
import sys
import re
import glib
import time
import MySQLdb
import glob

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
        self.wTree = gtk.Builder()
        self.wTree.add_from_file("herramienta_diag_gui.glade")
        self.gui()
       
    def gui(self):
        # importamos el archivo glade
        self.constructor= gtk.Builder()
        self.constructor.add_from_file("herramienta_diag_gui.glade")
        self.constructor.connect_signals(self)
        # ventana principal
        self.ventana = self.constructor.get_object("ventana")
        self.ventana.connect ("delete_event", gtk.main_quit)
        self.ruta = self.constructor.get_object("ruta")
        self.lista = self.constructor.get_object("lista")
        self.boton_nombres_invalidos = self.constructor.get_object("boton_nombres_invalidos")
        self.boton_formatos_invalidos = self.constructor.get_object("boton_formatos_invalidos")
        self.boton_duplicados = self.constructor.get_object("boton_duplicados")
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
        self.button_existe = self.constructor.get_object("button_existe")
        self.ventana.show()
    
    def ocultar_visor(self, window,event):
        self.ventana_visor.hide()
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


    def proceso_nombre_invalidos(self, id_analisis_contenido):
        # proceso correspondiente a nombres invalidos
        self.nombres_invalidos = gtk.TextBuffer()
        
        self.comando_inv = "find "+self.ruta.get_text()+" -name "+"\"* *\""        
        
        self.data_invlidos = os.popen(self.comando_inv).read()
        self.data_num_inv = 0
        #self.nombres_invalidos = gtk.TextBuffer()
        for path, dirs, files in os.walk(self.ruta.get_text()):
            for filename in files:
				#insertar archivos a la tabla
				#TODO: Se debe verificar que el archivo posea una extension de lo contrario de error
				tipo_formato = filename.split(".")[1]			
				id_formato_archivo = self.get_formato_archivo(tipo_formato)					
				add_archivo = ('''INSERT INTO archivo
				(nombre_arch, ubicacion_arch,id_analisis,id_formato_archivo)
				VALUES (%s,%s,%s,%s)''')				
				args = (filename, path, int(id_analisis_contenido), int(id_formato_archivo))
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
        
    def proceso_duplicados(self):
	#self.barra.pulse()
        # proceso correspondiente a archivos duplicados
        self.archivos_duplicados = gtk.TextBuffer()
        #####Preparandolo para Ponerlo #######
        self.comando_fdupes = "fdupes -rS "+self.ruta.get_text()
        self.data_find = os.popen(self.comando_fdupes).read()
        self.data_fdupes = os.popen(self.comando_fdupes).read()
        self.comando_num_fdupes = "fdupes -rm "+self.ruta.get_text()
        #print "comando: "+self.comando_num_fdupes
        self.data_num_fdupes = str(os.popen(self.comando_num_fdupes).read())
        self.comando_find = "fdupes -rS  "+self.ruta.get_text()
        #proceso con expresion regular el número de duplicados:
        self.data_num_fdupes = re.split('\s+',self.data_num_fdupes )[0]
        self.etiqueta_duplicados.set_text(self.data_num_fdupes)
        self.etiqueta_duplicados.set_visible(True)
        self.archivos_duplicados.set_text(self.data_fdupes)
        #self.barra.set_fraction(0.66) #progressbar variable
	return True
       
    def proceso_formatos_invalidos(self, id_analisis_contenido):

		# proceso correspondiente a formatos invalidos
		self.formatos_invalidos = gtk.TextBuffer()
		#####Preparandolo para Ponerlo #######
		self.comando_find = "find "+self.ruta.get_text()+" -name "+"*.odt -o -name *.pps -o -name *.doc -o -name *.wma -o -name *.ppt -o -name *.avi -o -name *.wmv -o -name *.xlw -o -name *.wmv"
		#print self.comando_find
		self.data_formatos = os.popen(self.comando_find).read()
		self.data_num_find = 0
		#self.formatos_invalidos= gtk.TextBuffer()
		for path, dirs, files in os.walk(self.ruta.get_text()):
			for filename in files:
				
				#Se inserta los archivos encontrados
				#TODO: Se debe verificar que el archivo posea una extension de lo contrario de error
				tipo_formato = filename.split(".")[1]			
				id_formato_archivo = self.get_formato_archivo(tipo_formato)					
				add_archivo = ('''INSERT INTO archivo
				(nombre_arch, ubicacion_arch,id_analisis,id_formato_archivo)
				VALUES (%s,%s,%s,%s)''')				
				args = (filename, path, int(id_analisis_contenido), int(id_formato_archivo))
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
	
    def get_formato_archivo(self, tipo_formato):
		if tipo_formato == "doc":
			return 1
		if tipo_formato == "docx":
			return 2
		if tipo_formato == "xls":
			return 3
		if tipo_formato == "xlsx":
			return 4
		if tipo_formato == "ppt":
			return 5
		if tipo_formato == "pptx":
			return 6
		if tipo_formato == "odt":
			return 7
			
		
                    
    def on_boton_diagnosticar_clicked(self, widget):
        # Proceso        
        self.barra.set_fraction(0.0)        
        self.comando_cd = "cd "+self.ruta.get_text()               
        self.data_cd=os.path.exists(self.ruta.get_text())        
        print self.data_cd
        if self.data_cd:			
			#Se crea conexión a db
			self.db = MySQLdb.connect("localhost","root","canaima","dc_ce")
			self.cursor = self.db.cursor()
			#abrir transaccion db
			self.db.autocommit(False)			
			   #self.proceso_nombre_invalidos()
			try:
				#Se crear un registro en la tabla analisis_contenido
				add_archivo = ('''INSERT INTO analisis_contenido
						(fecha_analisis, hora_analisis)
						VALUES (CURRENT_DATE(), CURRENT_TIME())''')			
				self.cursor.execute (add_archivo)
								
				last_id_analisis_contenido = self.get_last_id()				
				
				if self.proceso_nombre_invalidos(last_id_analisis_contenido):
					if self.proceso_duplicados():
						if self.proceso_formatos_invalidos(last_id_analisis_contenido):
							self.barra.set_fraction(1)
							## Falta validar que los buffers no estén vacios para mostrar los botones
							self.boton_nombres_invalidos.set_sensitive(True)
							self.boton_formatos_invalidos.set_sensitive(True)
							self.boton_duplicados.set_sensitive(True)
				else:
					self.window1.show()
				
				self.db.commit()
			except:
				print("Error inesperado:", sys.exc_info())
				self.db.rollback()
								
			#cerrar transaccion db
			self.db.autocommit(True)
			#cerrar conexion			
			self.cursor.close()
			self.db.close()
			
         
    def on_boton_visor_grabar_clicked(self,widget):
        self.filechooser.show()

    def on_boton_button_existe_clicked(self,widget):
        self.window1.hide()
        
    def on_boton_filechooser_grabar_clicked(self,widget):
        #funcion grabar del filechooser
        self.ruta_grabar = str(self.filechooser.get_filename())
        self.lista = str(self.lista1)
        #print "lissssta :"+self.lista
        #print "ruta a imprimir"+self.ruta_grabar
        self.escribir_archivo(self.lista,self.ruta_grabar)
    
    def escribir_archivo(self,lista,ruta ):
        #print "funcion para escribir en archivos"
        #print "ruta a usar dentro de la funcion:"+ruta
        archivo = open(ruta, 'w')
        if  lista == "formatos":
           archivo.write(self.data_formatos)
        if  lista == "invalidos":
           archivo.write(self.data_invlidos)
        if lista == "repetidos":
            archivo.write(self.data_find)
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
    gtk.main()
