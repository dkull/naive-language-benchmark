import std/monotimes
import times

proc powmod(base: int, pow: int, m: int): int =
  var 
    output = uint(1)
    base = uint(base)
    pow = uint(pow)
    m = uint(m)

  while pow > 0:
    if (pow and 1) == 1:
      output = (output * base) mod m
    base = (base * base) mod m
    pow = pow shr 1

  result = int(output)

# test powmod
assert(powmod(17, 13, 123223) == 2117, "modpow is broken")

proc witness(n: int, s: int, d: int, a: int): bool =
  var
    x = uint(powmod(a, d, n))
    n = uint(n)
    s = uint(s)
    y = uint(0)

  while s > 0:
    y = (x * x) mod n
    if (y == 1) and (x != 1) and (x != (n - 1)):
      return false
    x = y
    s -= 1

  if y != 1:
    return false
  return true

proc is_miller_rabin_prime(n: int, witnesses: openArray[int]): bool =
  var 
    d: int = n div 2
    s = 1

  while (d and 1) != 1:
    d = d div 2
    s += 1

  for _, w in witnesses:
    if not witness(n, s, d, w):
      return false

  return true

proc main() =
  let start = getMonoTime()
  let witnesses: array[7, int] = [2,3,5,7,11,13,17];

  var prime_count = 0
  for i in 3..<2500000:
    if (i.is_miller_rabin_prime(witnesses)):
      prime_count += 1

  let delta = (getMonoTime() - start).inMilliseconds()
  echo "|nim|millerrabin|", $prime_count, "|", delta, "|"

when isMainModule:
  main()
