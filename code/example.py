import math

def mean(values):
    """Arithmetic mean of a list of numbers."""
    return sum(values) / len(values)

def std(values):
    """Population standard deviation."""
    m = mean(values)
    return math.sqrt(sum((v - m) ** 2 for v in values) / len(values))

data = [2, 4, 4, 4, 5, 5, 7, 9]
print(f"mean = {mean(data):.2f}, std = {std(data):.2f}")
