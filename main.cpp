#include <iostream>

#include <cstring>

int main(int argc, char **argv)
{
	if (argc == 2 && strcmp(argv[1], "version") == 0)
	{
		std::cout << "VERSION 1.0.0" << std::endl;
		return EXIT_SUCCESS;
	}
	
	std::cout << "Hello, Jenkins!" << std::endl;

	return EXIT_SUCCESS;
}
