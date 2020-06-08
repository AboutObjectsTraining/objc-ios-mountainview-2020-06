#include "ANSICBasics.h"

float ConvertToFahrenheit(float celsiusTemperature);
void  ShowFahrenheitConversion(float celsiusTemperature);


void RunANSICBasics01(void)
{
    printf("\n%s\n-----------\n", __func__);
    
    ShowFahrenheitConversion(-17.8);
    ShowFahrenheitConversion(0.0);
    ShowFahrenheitConversion(12.8);
    ShowFahrenheitConversion(24.2);
    ShowFahrenheitConversion(37.0);
}


void ShowFahrenheitConversion(float celsiusTemperature)
{
    printf("%.1f degrees Celsius is %.1f degrees Fahrenheit\n",
           celsiusTemperature,
           ConvertToFahrenheit(celsiusTemperature));
}

float ConvertToFahrenheit(float celsiusTemperature)
{
    return celsiusTemperature * (F_SCALE / C_SCALE) + F_FREEZING_POINT;
}

