#include "types.h"
#include "stat.h"
#include "user.h"
#define NULL ((void*)0)
/*
	THIS TEST IS CREATING A POINTER MAKING IT  POINTS TO A NULL
	THEN TRYING TO DEREFERENCE IT
*/
int
main(int argc, char *argv[])
{
  
int *pi;     // a pointer to an integer

pi=NULL;
printf(1,"\t IT WILL TRAP NOW  \n");
printf(1,"%d \n" ,*pi); //trying to dereference the pointer
printf(1,"THE TEST IS FAILED IF THIS LINE IS PRINTED");

   exit();
}
