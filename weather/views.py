from django.shortcuts import render

from weather.integration.integration import IntegrationWeather


# Create your views here.
def temperaturas_city(request):
    """ Page initialization """
    return render(request,'template_init.html')

def response_temperaturas(request):
    integration=IntegrationWeather()
    context=integration.api_consumption(request.POST['ciudad1'])
    return render (request, 'template_response.html', context)