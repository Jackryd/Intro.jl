double compute_series(int n) {
    double total = 0.0;
    for (long long i = 1; i <= n; ++i) {
        total += 1.0 / (i * i);
    }
    return total;
}
