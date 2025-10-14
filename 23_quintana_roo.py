#!/usr/bin/env python
# coding: utf-8
# Imports
from climex import climex
import pandas as pd
import multiprocessing
import sys

def main():
    """Función principal para descargar datos climáticos de NASA POWER para Estado de Quintana Roo"""
    
    # Configurar multiprocessing para macOS
    if sys.platform == 'darwin':
        try:
            multiprocessing.set_start_method('spawn', force=True)
        except RuntimeError:
            pass  # Ya fue configurado
    
    print("Step 1: Cargando dataset de centroides de...")
    path_centroid = "/Users/fdzul/Library/CloudStorage/Dropbox/dataset/nasa_power/climex_download/mexico_mpo_centroid.csv"
    dtype_dic = {'CVEGEO': str}
    x = pd.read_csv(path_centroid, dtype=dtype_dic)
    
    print("Step 2: Generando columna de estado...")
    x['edo'] = x['CVEGEO'].astype(str).str[:-3]
    print(f"Total de registros: {len(x)}")
    
    print("Step 3: Extrayendo estado de...")
    x = x[(x['edo'] == "23")]
    print(f"Registros para : {len(x)}")
    
    print("Step 4: Limpiando datos...")
    x = x.drop(["edo"], axis=1)
    
    print("Step 5: Descargando datos climáticos para...")
    path_data = "/Users/fdzul/Library/CloudStorage/Dropbox/dataset/nasa_power/climex_download/data/prospective/23_quintana_roo/"
    
    clim = climex.download_nasa_power_data(
        df=x,
        lat_col='y',
        lon_col='x',
        start_date='20250101',
        end_date='20250925',
        parameters=['T2M', 'RH2M', 'PRECTOTCORR'],
        temporal_resolution='daily',
        spatial_resolution='point',
        community='AG',
        processes=6,
        output_folder=path_data,
        id_col='CVEGEO'
    )
    
    print("Step 6: Exportando datos climáticos a CSV...")
    print("\nPrimeras filas:")
    print(clim.head())
    
    print("\nÚltimas filas:")
    print(clim.tail())
    
    output_file = '/Users/fdzul/Library/CloudStorage/Dropbox/dataset/nasa_power/climex_download/data/prospective_dataclim_23_quintana_roo.csv'
    clim.to_csv(output_file)
    print(f"\n✓ Datos guardados en: {output_file}")

if __name__ == '__main__':
    multiprocessing.freeze_support()
    main()