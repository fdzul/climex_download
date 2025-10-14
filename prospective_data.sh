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
python 06_colima.py
python 07_chiapas.py
python 08_chihuahua.py
python 09_cdmx.py
python 10_durango.py
python 11_guanajuato.py
python 12_guerrero.py
python 13_hidalgo.py
python 14_jalisco.py
python 15_estado_mexico.py
python 16_michoacan.py
python 17_morelos.py
python 18_nayarit.py
python 19_nuevo_leon.py
python 20_oaxaca.py
python 21_puebla.py
python 22_queretaro.py
python 23_quintana_roo.py
python 24_san_luis_potosi.py
python 25_sinaloa.py
python 26_sonora_.py
python 27_tabasco.py
python 28_tamaulipas.py
python 29_tlaxcala.py
python 30_veracruz.py
python 31_yucatan.py
python 32_zacatecas.py


echo -e "${GREEN}Descarga de NASA Power completada${NC}"