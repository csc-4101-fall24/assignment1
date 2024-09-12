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
    i = i + 1
  end 
  return true 
end

def nthmax(n, a)
  if a.length < n then
    return nil
  end 
  a.sort!
  return a[a.length - (n + 1)]
end

def freq(s)
  if s.length == 0 then
    return ""
  end 

  hash = Hash.new
  i = 1
  hash[s[i]] = 1
  maxChar = s[i]
  while i < s.length
    hash[s[i]] =  hash[s[i]].nil? ? 1 : hash[s[i]] + 1
    if hash[maxChar] < hash[s[i]] then
      maxChar = s[i]
    end
    i = i + 1
  end
  return maxChar
end

def zipHash(arr1, arr2)
  if arr1.length != arr2.length then 
    return nil
  end 
  map = Hash.new 
  i = 0
  while i < arr1.length
    map[arr1[i]] = arr2[i]
    i = i + 1
  end
  return map 
end

def hashToArray(hash)
  arr = Array.new
  index = 0 
  for k in hash.keys()
    arr[index] = [k, hash[k]]
    index = index + 1
  end 
  return arr

end
