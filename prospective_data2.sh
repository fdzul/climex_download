#!/bin/bash

# Colores para mensajes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting download NASA Power Dataset...${NC}"

# Directorio de trabajo
cd /Users/fdzul/Dropbox/dataset/nasa_power/climex_download/

# Cargar conda (sin ejecutar conda init nuevamente)
source "$(conda info --base)/etc/profile.d/conda.sh"

# Activar el ambiente
if conda activate spatial; then
    echo -e "${GREEN}Ambiente 'spatial' activado correctamente${NC}"
else
    echo -e "${RED}Error: No se pudo activar el ambiente 'spatial'${NC}"
    exit 1
fi

# Opción 1: Si quieres ejecutar el notebook sin interfaz interactiva
# Descomenta esta línea y comenta la siguiente
# Directorio de trabajo
cd /Users/fdzul/Dropbox/dataset/nasa_power/climex_download/
#jupyter nbconvert --to notebook --execute climatic_01_Aguascalientes_prospective.ipynb
python 01_aguascalientes.py
python 02_baja_california.py
python 03_baja_california_sur.py
python 04_campeche.py
python 05_coahuila.py



#jupyter nbconvert --to notebook --execute climatic_02_Baja_California_prospective.ipynb



echo -e "${GREEN}Descarga de NASA Power completada${NC}"