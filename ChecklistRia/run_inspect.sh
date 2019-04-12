#!/bin/bash
#INVENTORY=ruta de archivo inventario
#HOSTS=Nombre de maquina o grupo de maquinas de inventario ansible
#INSPEC_PROFILE=directorio del profile de Inspec
#PORT= Puerto de acceso ssh (-p 443, -p 22)
#CONTROLS=nombre del control a ejecutar (--controls=nombrecontrol)

ansible all -i $INVENTORY --limit $HOSTS -m debug -a "var=ansible_ssh_host"| grep "ansible_ssh_host" |sed 's/\x1b\[[0-9;]*m//g'|sed 's/"//g'|awk {'print $2'} |while read -r line
do
   echo inspec exec $INSPEC_PROFILE -t ssh://ria_soptec@$line $PORT $PASSWORD --reporter documentation junit:./$line.xml

   inspec exec $INSPEC_PROFILE -t ssh://ria_soptec@$line $PORT $PASSWORD --reporter documentation junit:./$line.xml
done



#esta es otra prueba
