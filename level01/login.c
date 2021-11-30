#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
	if(argc != 2)
	{
		printf("ERROR ARGUMENTS!\n");
		return (0);
	}
	if (strcmp(argv[1], "cybersec") == 0)
		printf("I'M IN!\n");
	else
		printf("WRONG PASSWORD!\n");
	return (0);
}
