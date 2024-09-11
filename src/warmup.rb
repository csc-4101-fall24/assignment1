def fib(n)
   
return [] if n == 0
   return [0] if n == 1
   return [0,1] if n == 2
 
   fibonacci = fib(n - 1)
   fibonacci << fibonacci[-2] + fibonacci[-1]
   return fibonacci

end

def isPalindrome(n)
   
palindrome = n.to_s
    if palindrome == palindrome.reverse
    return true
    else 
    return false
    
    end 
end

def nthmax(n, a)
    
if n > a.size
    return nil
    else
reversedA = a.sort.reverse
reversedA[n]
end

end

def freq(s)
    
if s.length == 0
    return ""
    end 
    
    charCount = Hash.new(0)
    s.each_char do |char|
    charCount[char] = charCount[char] + 1
    end
    
    charCount.max_by{|char, count| count} [0]

end

def zipHash(arr1, arr2)
    
if arr1.length != arr2.length
    return nil
    end 
    
    Hash[arr1.zip(arr2)]

end

def hashToArray(hash)
    
array = []
    hash.each do |pair|
    array << pair
    end

array

end
