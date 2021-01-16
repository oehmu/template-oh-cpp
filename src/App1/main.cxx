#include <iostream>


// ┌──────────────────────────────────────────────────────────────────┐
// │            version from cmake                                    │
// └──────────────────────────────────────────────────────────────────┘
//Logic to pass version of APP from CMAKE scripts
#ifdef VERSIONAPP
#define XSTR(x) #x
#define STR(x) XSTR(x)
//#define STR(x) x
#endif

std::string say_hello() {
#ifdef IS_WINDOWS
  return std::string("Hello from Windows!");
#elif IS_LINUX
  return std::string("Hello from Linux!");
#elif IS_MACOS
  return std::string("Hello from macOS!");
#else
  return std::string("Hello from an unknown system!");
#endif
}

int main(int argc, char *argv[]) {
	
	#ifdef _DEBUG
		int debug;
		std::cout << "Attach to process...";
		std::cin >> debug;
	#endif

	#ifdef VERSIONAPP
    	char versionAPP[30];
        std::strcpy(versionAPP, STR(VERSIONAPP));
        std::cout << "\n Software = App1 \n"
			      << " Version  = " << versionAPP << '\n';
        std::cout << "\n" << '\n';
    #endif

	std::cout << say_hello() << "\n\n";
	std::cout << "App1" << std::endl;

	return 0;
}
