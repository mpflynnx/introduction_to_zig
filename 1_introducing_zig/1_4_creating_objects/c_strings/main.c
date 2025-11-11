/* C example, if you want to track the length of your string 
throughout your program in C, then, you first need to loop 
through the array of bytes that represents this string, and 
find the null element ('\0') position to discover where exactly 
the array ends, or, in other words, to find how much elements 
the array of bytes contain.
*/
#include <stdio.h>
int main() {
    char* array = "An example of string in C";
    int index = 0;
    while (1) {
        if (array[index] == '\0') {
            break;
        }
        index++;
    }
    printf("Number of elements in the array: %d\n", index);
}