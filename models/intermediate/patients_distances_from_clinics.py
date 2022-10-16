import pandas as pd
from shapely import geometry as geo
import geopandas as gpd

def model(dbt, session):
    dbt.config(
        materialized = 'table',
        packages = ['pandas', 'shapely', 'geopandas']
    )

    patients = dbt.ref("stg_patients").to_pandas()
    patients_df = pd.DataFrame(patients)
    patients_df['geometry'] = patients_df.apply(lambda x: geo.Point((x.LON, x.LAT)), axis = 1)
    patients_geodf = gpd.GeoDataFrame(patients_df, crs = {'init': 'epsg:4326'}, geometry = patients_df.geometry)

    clinics = dbt.ref("stg_clinics").to_pandas()
    clinics_df = pd.DataFrame(clinics)
    clinics_df['geometry'] = clinics_df.apply(lambda x: geo.Point((x.LON, x.LAT)), axis = 1)
    clinics_geodf = gpd.GeoDataFrame(clinics_df, crs = {'init': 'epsg:4326'}, geometry = clinics_df.geometry)

    patients_geodf['DISTANCE'] = patients_geodf.geometry.apply(lambda g: clinics_geodf.distance(g))

    final_df = pd.DataFrame(patients_geodf.drop(columns=['geometry']))

    return final_df