
#include <iostream>
using namespace std;
int main() {
	int width, length, a, b, c, perimeter;
	cout << endl;
	cout << " ================              /\\ \n";
	cout << " |              |             /  \\ \n";
	cout << " |              | Width    a /    \\ c \n";
	cout << " |              |           /      \\ \n";
	cout << " ================           --------  \n";
	cout << "      Length                    b\n";
	cout << "\nEnter the values of width and length: ";
	cin >> width; cin >> length;
	cout << "Enter the values of sides a, b, and c: ";
	cin >> a; cin >> b; cin >> c;

	asm ("movl %%eax, %%ecx;\n"
		 "addl %%ecx, %%eax;\n"
		 "addl %%ebx, %%eax;\n"
		 "addl %%ebx, %%eax;\n"
		: "=a"(perimeter) : "a"(width), "b"(length));
	cout << "The perimeter of rectangle is: " << dec << perimeter;

	asm ("addl %%ecx, %%eax;\n"
		 "addl %%ebx, %%eax;\n"
		: "=a"(perimeter) : "a"(a), "b"(b), "c"(c));
	cout << "\nThe perimeter of triangle is: " << dec << perimeter;
	cout << "\n\n";

	return 0;
}