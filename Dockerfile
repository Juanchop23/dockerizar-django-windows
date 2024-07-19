# Usa la imagen de Python 3.12.2 basada en Debian Bullseye en su variante slim como la imagen base
FROM python:3.12.2-slim-bullseye

# Variable de entorno para no almacenar en buffer la salida de Python
ENV PYTHONBUFFERED=1

# Variable de entorno para el puerto web
ENV PORT 8080

# Establecer el directorio de trabajo dentro del contenedor a /app para los comandos subsecuentes
WORKDIR /app

# Copia el contenido completo del directorio actual en la máquina host al directorio /app del contenedor
COPY . /app/

# Actualizar pip
RUN pip install --upgrade pip

# Instala las dependencias desde el archivo requirements.txt para preparar el entorno de Python
RUN pip install -r requirements.txt

# Establece el comando para ejecutar nuestro servicio web usando Gunicorn, enlazándolo a 0.0.0.0 y al puerto definido en la variable de entorno PORT
CMD gunicorn myproject.wsgi:application --bind 0.0.0.0:"${PORT}"

# Informa a Docker que el contenedor escucha en el puerto de red especificado en tiempo de ejecución
EXPOSE ${PORT}