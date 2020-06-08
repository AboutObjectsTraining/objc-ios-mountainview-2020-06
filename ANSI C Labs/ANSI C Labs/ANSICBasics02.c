#include "ANSICBasics.h"

enum ConversionType {
    CelsiusToFahrenheit,
    FahrenheitToCelsius,
};

typedef enum ConversionType ConversionType;

float ConvertTemperature(float, ConversionType);
void ShowConversion(float, ConversionType);


void RunANSICBasics02(void)
{
    printf("\n%s\n-----------\n", __func__);
    
    ShowConversion(-17.8, CelsiusToFahrenheit);
    ShowConversion(0.0, CelsiusToFahrenheit);

    ShowConversion(0.0, FahrenheitToCelsius);
    ShowConversion(98.6, FahrenheitToCelsius);
    ShowConversion(F_FREEZING_POINT, FahrenheitToCelsius);
    ShowConversion(F_BOILING_POINT, FahrenheitToCelsius);
}


void ShowConversion(float temperature, ConversionType type)
{
    printf("%.1f degrees %s is %.1f degrees %s\n",
           temperature,
           type == CelsiusToFahrenheit ? "Celsius" : "Fahrenheit",
           ConvertTemperature(temperature, type),
           type == CelsiusToFahrenheit ? "Fahrenheit" : "Celsius");
}

float ConvertTemperature(float temperature, ConversionType type)
{
    return (type == CelsiusToFahrenheit ?
            temperature * F_SCALE / C_SCALE + F_FREEZING_POINT :
            (temperature - F_FREEZING_POINT) * C_SCALE / F_SCALE);
}
