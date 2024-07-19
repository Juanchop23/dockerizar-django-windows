#Aquí determinamos si vamos a usar las
#configuraciones de entorno local o de
#producción

import os

#Obtener las variables de entorno
def get_secret(secret_id, backup=None):
    return os.getenv(secret_id, backup)

# Tipo de ambiente
if get_secret('PIPELINE') == 'production':
    from .production import *
else:
    from .local import *