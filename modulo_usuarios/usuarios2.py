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


#class Proceso_agregar_usuarios():


# Definir lista global

global lista 
lista = list()

# defino los atributos del usuario
class Usuario:
	cedula = ""
	nombre = ""
	apellido = ""
	clave = ""

def registrarUsuario():
	print "registrar"
	
def mostrarUsuarios():
	print "mostrar"
	
def consultarUsuario():
	print "buscar"
	
def salir():
	print "salir"
	
def menu():
	op = 0
	salir_menu = 4
	while op != salir_menu:
		#mostrar menu
		print "Menú"
		print "1.-- Registrar Usuario"
		print "2.-- Mostrar Usuarios"
		print "3.-- Consultar Usuario"
		print "4.-- Salir"
		op = input("Ingrese Opción:  ")
		
		if op == 1:
			registrarUsuario()
		elif op == 2:
			mostrarUsuarios()
		elif op == 3:
			consultarUsuario()
		elif op == 4:
			exit
			
menu()
			





    
    
