def fib(n)
  return 0 if n == 0

  fib_0 = 0
  fib_1 = 1

  (1...n).each do
    ans = fib_0 + fib_1
    fib_0 = fib_1
    fib_1 = ans
  end

  return fib_1
end
