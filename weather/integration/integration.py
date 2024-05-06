import requests


class IntegrationWeather:
    "Class responsible for integrating wttr.in weather API"

    def __init__(self):
        ...
    
    def api_consumption(self, contry: str):
        """
            Method in charge of returning climate x city format json
            Documentation https://github.com/chubin/wttr.in
        
        """
       
        url=f"https://es.wttr.in/{contry}?format=j1"
        response=requests.get(url)
        datos= response.json()
        
        return self.data_templates(datos)
    
    
    def data_templates(self, datos:dict):
        """Method build data templates"""

        ciudad=datos["nearest_area"][0]["areaName"][0]["value"]
        país=datos["nearest_area"][0]["country"][0]["value"]
        region=datos["nearest_area"][0]["region"][0]["value"]
        datos_pronósticos = []
        for forecast in datos["weather"]:
            datos_pronósticos.append({
                "date":forecast["date"],
                "average_temperature":forecast["avgtempC"],
                "average_temperature_min":forecast["mintempC"],
                "average_temperature_max":forecast["maxtempC"],
            })

        data = {
            "city":ciudad,
            "country":país,
            "region":region,
            "pronósticos":datos_pronósticos
        }

        return data


