/* example.c */

#include <stdio.h> /* h for header file*/
extern int say_hi(int x);
int main(int argc,char *argv[])
{
    int val=5;
    printf("Hello From C! \n" );
    printf("Value passed to Assembly : %d \n",val);
    val=say_hi(val);
printf("Value returned from Assembly : %d \n",val);
}