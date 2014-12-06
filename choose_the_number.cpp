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


//	string kMinStr = "The minimum number?";
//	string kMaxStr = "The maximum number?";
	string kMinStr = "minimum";
	string kMaxStr = "maximum";
	string buf;
	ofstream ofs("output");
	while (1) {

		// input numbers
		string s;
		getline(cin, s);
		ofs << s << endl;
	//	s = "5, -6, 10, -10";
		vector<string> vs = split(s, ',');
		vector<int> vi;
		stringstream ss;
		for (int i = 0; i < vs.size(); i++) {
			ss << vs[i] << endl;
			int t; ss >> t; vi.push_back(t);
//			cerr << vi[i] << endl;
		}

		// input question
		cin >> buf;
		cin >> buf;
		ofs << buf;
		s = buf;
		cin >> buf;
//		getline(cin, s);
//		ofs << s << endl;
		if (s == kMaxStr) {
			sort(vi.rbegin(), vi.rend());
		} else if (s == kMinStr) {
				sort(vi.begin(), vi.end());
		}

		cout << vi[0] << endl;
		ofs << vi[0] << endl;
	}




	return 0;
}