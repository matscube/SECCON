#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>

using namespace std;


vector<string> split(const string &s, char delim) {
    vector<string> elems;
    stringstream ss(s);
    string item;
    while (getline(ss, item, delim)) {
    if (!item.empty()) {
            elems.push_back(item);
        }
    }
    return elems;
}

int main() {


	string n, m;
//	getline(cin , n); cin.ignore();
//	cin >> m;
	while (1) {
		string n;
//		getline(cin , n);
		read(n);
//		cin >> n;
		cout << n << endl;
	}
	cout << n << endl;
	getline(cin , m);
	cout << m << endl;
	getline(cin , m);
	cout << m << endl;
	getline(cin , m);
	cout << m << endl;
	for (int i = 0; i < 100; i++) {
		cout << 11 << endl;
	}




	return 0;
}