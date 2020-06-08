#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "Utilities.h"
#include "Person.h"

const char *Separator = ", ";
const char *AgeLabel = "Age: ";
const char *NotAvailable = "N/A";


// PART 1

Person *AllocPerson(void)
{
    return calloc(1, sizeof(Person));
}

Person *InitPerson(Person *self,
                   const char *firstName,
                   const char *lastName,
                   int age)
{
    self->firstName = CopyString(firstName);
    self->lastName = CopyString(lastName);
    self->age = age;
    
    return self;
}


// PART 2

const char *FirstNameFromPerson(Person *self)
{
    if (self->firstName == NULL) {
        return NotAvailable;
    }
    
    return self->firstName;
}

const char *LastNameFromPerson(Person *self)
{
    if (self->lastName == NULL) {
        return NotAvailable;
    }
    
    return self->lastName;
}


size_t DescriptionLength(Person *self)
{
    char ageString[4];
    sprintf(ageString, "%d", self->age);
    
    size_t length = (strlen(FirstNameFromPerson(self)) + strlen(Separator) +
                     strlen(LastNameFromPerson(self)) + strlen(Separator) +
                     strlen(AgeLabel) + strlen(ageString));
    return length;
}

char *CreateDescriptionOfPerson(Person *self)
{
    size_t length = DescriptionLength(self);
    char *description = malloc(length + 1);
    
    sprintf(description, "%s%s%s%s%s%d",
            LastNameFromPerson(self), Separator, FirstNameFromPerson(self),
            Separator, AgeLabel,
            self->age);
    
    return description;
}


// PART 3

void PrintPerson(Person *self)
{
    char *description = CreateDescriptionOfPerson(self);
    printf("%s\n", description);
    free(description);
}

// PART 4

Person *NewPerson(const char *firstName,
                  const char *lastName,
                  int age)
{
    return InitPerson(AllocPerson(), firstName, lastName, age);
}


// BONUS LAB.

void DeallocPerson(Person *self)
{
    SetFirstName(self, NULL);
    SetLastName(self, NULL);
    
    free(self);
}


void SetFirstName(Person *self, const char *name)
{
    if (name == self->firstName) return;
    
    if (self->firstName != NULL) {
        free(self->firstName);
    }
    
    self->firstName = CopyString(name);
}

void SetLastName(Person *self, const char *name)
{
    if (name == self->lastName) return;
    
    if (self->lastName != NULL) {
        free(self->lastName);
    }
    
    self->lastName = CopyString(name);
}
