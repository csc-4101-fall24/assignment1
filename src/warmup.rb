def fib(n)
  first = 0
  second = 1; 
  array = [first, second]
  if (n == 0) then 
    return [first]
  elsif (n == 1) 
    return [first, second]
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
    raise Exception, "Not Implemented"
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
