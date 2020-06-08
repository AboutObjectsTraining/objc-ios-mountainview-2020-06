#include <string.h>
#include <stdlib.h>

#include "Utilities.h"

char *CopyString(const char *string)
{
    if (string == NULL) return NULL;
    
    char *copy = NULL;
    copy = malloc(strlen(string) + 1);
    strcpy(copy, string);
    
    return copy;
}


