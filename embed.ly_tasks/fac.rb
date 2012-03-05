#n! means n * (n - 1) * ... * 3 * 2 * 1

#For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800

#Let R(n) equal the sum of the digits in the number n!

#For example, R(10) is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

#Find the lowest value for n where R(n) is 8001.

def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end

def R(n)
  r=0
  n.to_s.each_char do |char|
    r=r+char.to_i
  end
  return r
end


for i in 0..10000
  if R(fact(i)).to_s=='8001'
  puts i.to_s+"=="+R(fact(i)).to_s
    break
  end
end


