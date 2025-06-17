# Example Python code:

def compute_series(n):
    total = 0.0
    for i in range(1, n+1):
        total += 1 / (i * i)
    return total

result = compute_series(100_000_000)  # takes ~20 seconds
print(result)
