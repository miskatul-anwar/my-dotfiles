{...}:{
  home.file.".config/VSCodium/User/snippets/cpp.json".text = ''
    {
      "ICPC Fast Template": {
        "prefix": "icpc",
        "body": [
          "#include <bits/stdc++.h>",
          "using namespace std;",
          "",
          "using ll = long long;",
          "using ld = long double;",
          "using pii = pair<int,int>;",
          "using pll = pair<ll,ll>;",
          "using vi = vector<int>;",
          "using vll = vector<ll>;",
          "",
          "inline void fast_io() {",
          "    ios::sync_with_stdio(false);",
          "    cin.tie(nullptr);",
          "}",
          "",
          "int main() {",
          "    fast_io();",
          "    ",
          "    // your code here",
          "    ",
          "    return 0;",
          "}"
        ],
        "description": "Fast C++ ICPC template with aliases and fast I/O"
      }
    }
  '';
}
