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
import gtk
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


class Proceso_agregar_usuarios():
    
    def __init__(self):
        #Se crea conexión a db
        self.db = MySQLdb.connect("localhost","root","canaima","dc_ce")
    
    def insertar_usuario(self):
        nombre = str(raw_input('Ingrese su Nombre: '))
        apellido = str(raw_input('Ingrese su Apellido: '))
        cedula = str(raw_input('Ingrese su Cédula: '))
        clave = str(raw_input('Ingrese una clave: '))
    
    
        try:
            self.cursor = self.db.cursor()
        #abrir transaccion db
            self.db.autocommit(False)
        #Se crear un registro en la tabla usuarios
            add_usuario = (''' INSERT INTO usuarios
            (nombre, apellido, cedula, clave)
            VALUES (%s, %s, %s, %s) ''')
            args = (nombre, apellido, cedula, clave)
            self.cursor.execute (add_usuario, args)
            self.db.commit()
        except:
            print("Error inesperado:", sys.exc_info())
            self.db.rollback()
            
        #cerrar transaccion db
        self.db.autocommit(True)
		#cerrar conexion			
        self.cursor.close()
        self.db.close()
       

if __name__ == '__main__':
    
    p = Proceso_agregar_usuarios()    
    p.insertar_usuario()

