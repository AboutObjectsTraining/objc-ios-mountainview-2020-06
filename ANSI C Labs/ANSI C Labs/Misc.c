//
//  Misc.c
//  ANSI C Labs
//
//  Created by Jonathan Lehr on 10/14/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//

#include <stdio.h>

void PrintInReverse(char *s)
{
    char *currChar;
    
    // Find the end.
    for (currChar = s; *currChar; currChar++); // Empty loop body.
    
    // Print backwards.
    for (currChar--; currChar != s; currChar--)
        printf("%c", *currChar);
    
    // Print the last char.
    printf("%c\n", *currChar);
}

void foo(void)
{
    printf("\n%s\n", __func__);
    char s[] = "star was noel";
    PrintInReverse(s);       // Prints: leon saw rats
}


void ArrayStuff(void)
{
    char foo[][12] = {
        "Hello",
        "World",
    };
    
    for (int i = 0; i < 2; i++) {
        printf("%p, %p, %s, %c, %c\n", foo[i], foo + i, foo[i], **(foo + i), *(*(foo + i) + 1));
    }
}

