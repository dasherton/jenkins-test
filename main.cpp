#include <iostream>

#include <cstring>

const char* getGITVersion()
{	return 
#include "git_version.in"
;
}

int main(int argc, char **argv)
{
	if (argc == 2 && strcmp(argv[1], "version") == 0)
	{
		std::cout << "GIT Info: " << getGITVersion() << "\n";
		return EXIT_SUCCESS;
	}
	
	std::cout << "Hello, Jenkins!" << std::endl;

	return EXIT_SUCCESS;
}
