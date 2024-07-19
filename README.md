# Tabla de contenido
- [Software necesario](#Necesario)  
- [Cómo se construyó](#Crear) 
- [Posibles errores](#introducción) 
- [Explicación paquetes](#Paquetes) 

# Necesario
1. Windows  
2. Docker Desktop  
3. Python instalado en el equipo  

Este código no se va a ejecutar si no se tiene cualquiera de las anteriores.

# Construir y ejecutar la imagen de Docker

**Tener Docker Desktop abierto**. De lo contrario, no funcionará.

El archivo Dockerfile contiene el paso a paso que sigue Docker para crear una imágen virtual.  

-Ejecutar ``docker build -t django-docker:latest .``  
**django-docker** es un nombre personalizado que podemos poner a nuestra imagen. El latest es para que se use la última versión disponible de Docker. El **punto al final del comando** es para especificar que ejecute el Dockerfile que está en este directorio.  

-**Copiar y pegar en la terminal donde se tiene el directorio**  
``docker run -p 8000:8080 --env PIPELINE=production --env SECRET_KEY=your_value --env DB_NAME=. --env DB_USER_NM=. --env DB_USER_PW=. --env DB_IP=0.0.0.0 --env DB_PORT=5432 django-docker``

Ejecutar la vista predeterminada del proyecto en localhost:8000/admin

Si en localhost:8000 saca un letrero de Not Found, el proyecto se está ejecutando correctamente.

# Crear
1. Crear un directorio.  
2. Acceder al directorio usando la consola de Windows o la terminal de VS Code.  
3. Crear un entorno virtual de Python: ``python -m venv venv`` -> El -m es para no tener que invocar al intérprete de Python.  
4. Activar el entorno virtual

Activar entorno virtual
``venv\Scripts\activate``

``pip install django``

``django-admin startproject dockerizar-django .``

# Ejecutar proyecto en la web
``python manage.py runserver``

# Paquetes
``psycopg2-binary`` paquete encargado de decirle a DJango que corra algo en producción. También permite a DJango conectarse a PostgreSQL.

``gunicorn`` Maneja las instancias de DJango.

# Generar archivo requirements.txt
``pip freeze > requirements.txt``

# Explicación del código
Se tiene una carpeta settings

El archivo local.py que está en el directorio settings contiene toda la configuración para correr el entorno de manera local. Por defecto DJango viene configurado para desarrollar en entorno local.

DEBUG está en False. Por defecto, DJango lo configura para correrlo en local pero si se ejecuta en producción pueden haber errores.

Todos los hosts son validos. Es decir, todo el mundo que tenga acceso a internet puede entrar a donde se aloje el proyecto.

Se tienen dos archivos de settings.py, uno para desarrollar y hacer debug en entorno local y otro para sacar a producción.

# Se necesita
-Saber cómo conectarse a una BD remotamente.
-

