#include <stdio.h>
#include <stdlib.h>

#include "Utilities.h"
#include "Person.h"

void RunPointers01(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *p1 = AllocPerson();
    printf("Name: %s %s, Age: %d\n", p1->firstName, p1->lastName, p1->age);
    
    InitPerson(p1, "Sue", "Wilson", 29);
    printf("Name: %s %s, Age: %d\n", p1->firstName, p1->lastName, p1->age);
    
    Person *p2 = InitPerson(AllocPerson(), "Fred", "Smith", 32);
    
    printf("Name: %s %s, Age: %d\n", p2->firstName, p2->lastName, p2->age);
    
    free(p1);
    free(p2);
}

void RunPointers02(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *p1 = InitPerson(AllocPerson(), "Fred", "Smith", 32);
    char *description = CreateDescriptionOfPerson(p1);
    
    printf("%s\n", description);
    
    free(description);
    free(p1);
}

void RunPointers03(void)
{
    PRINT_FUNCTION_NAME;

    Person *p1 = InitPerson(AllocPerson(), "Fred", "Smith", 32);
    PrintPerson(p1);
    
    free(p1);
}

void RunPointers04(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *peeps[] = {
        NewPerson("Sue", "Wilson", 29),
        NewPerson("Jan", "Miller", 31),
        NewPerson("Bob", "Garcia", 27)
    };
    
    for (int i = 0; i < 3; i++)
    {
        PrintPerson(peeps[i]);
        free(peeps[i]);
        peeps[i] = NULL;
    }
}

void RunPointers05(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *p1 = NewPerson("Fred", "Smith", 32);
    PrintPerson(p1);
    
    SetFirstName(p1, "Freddy");
    SetLastName(p1, "Smythe");
    PrintPerson(p1);
    
    DeallocPerson(p1);
    
    
    Person *p2 = NewPerson("Jan", "Miller", 31);
    PrintPerson(p2);
    
    SetLastName(p2, NULL);
    PrintPerson(p2);
    
    SetLastName(p2, "Brown");
    PrintPerson(p2);
    
    SetFirstName(p2, NULL);
    PrintPerson(p2);

    DeallocPerson(p2);
}
