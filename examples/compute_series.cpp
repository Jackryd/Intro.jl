// Example C++ code:

#include <iostream>
double compute_series(int n) {
    double total = 0.0;
    for (long long i = 1; i <= n; ++i) {
        total += 1.0 / (i * i);
    }
    return total;
}

int main() {
    double result = compute_series(100000000);  // takes ~0.1 seconds
    std::cout << result << std::endl;
    return 0;
}
