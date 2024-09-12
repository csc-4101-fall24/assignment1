def fib(n)
  first = 0
  second = 1; 
  array = [first, second]
  if n == 0 then 
    return []
  elsif n == 1 
    return [first]
  end 
  i = 2; 
  while i < n
    array[i] = first + second
    first = second
    second = array[i]
    i = i + 1
  end 
  return array 
end

def isPalindrome(n)
  if n < 10 then
    return true
  end 
  n = n.to_s
  i = 0
  while i < n.length/2
    if n[i] != n[n.length - 1] then
      return false
    end 
  end 
  return true 
end

def nthmax(n, a)
    raise Exception, "Not Implemented"
end

def freq(s)
    raise Exception, "Not Implemented"
end

def zipHash(arr1, arr2)
    raise Exception, "Not Implemented"
end

def hashToArray(hash)
    raise Exception, "Not Implemented"
end
