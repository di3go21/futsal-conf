#!/bin/bash

# Variables
PEM_KEY_PATH="/ruta/a/tu/clave.pem"  # Ruta a tu archivo .pem
LOCAL_FOLDER="/ruta/a/la/carpeta/front"  # Ruta local a la carpeta 'front'
EC2_USER="ubuntu"  # Usuario en la máquina EC2 (usualmente es 'ubuntu' para las AMIs de Ubuntu)
EC2_HOST="ip_de_tu_maquina_ec2"  # Dirección IP o hostname de tu instancia EC2
REMOTE_FOLDER="/var/www/html"  # Ruta en el servidor EC2 donde quieres copiar los archivos

# Comando para copiar archivos
echo "Copiando archivos de $LOCAL_FOLDER a $EC2_USER@$EC2_HOST:$REMOTE_FOLDER..."

scp -i $PEM_KEY_PATH -r $LOCAL_FOLDER/* $EC2_USER@$EC2_HOST:$REMOTE_FOLDER

# Verificación
if [ $? -eq 0 ]; then
  echo "Los archivos se copiaron correctamente."
else
  echo "Hubo un error al copiar los archivos."
fi
