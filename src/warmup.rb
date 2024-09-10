def fib(n)
    a=[0,1] #initializing the first two fibonacchi numbers
    while a.length < n # while loop to add the numbers to the array
        a.push(a[-1] + a[-2])
    end
    a.take(n) # Returning the arrays with the first n fibonacci numbers
end

def isPalindrome(n)
    s=n.to_s    # converting the integer to string
    a=s.chars   # converting the string to array of characters
    i=0         # initializing i       
    while i < (a.length / 2) # iterating from both front and back of the array
        if a[i] != a[a.length-1-i]
            return false
        end
        i = i+1
    end
    true
end

def nthmax(n, a)
    #n can not be larger than the size of the array, so check if n is larger than a
    if n>=a.length
        return l=nil
    end
    #sort the array in ascending order
    as=a.sort
    #the nth max 
    l=as[as.length-n-1]
end

def freq(s)
    #sorting and converting the string to arrays
    sorted=s.chars.sort      
    #assigning the first characater               
    current_char=sorted.first 
    #initialize              
    current_count=0                         
    max_char=""
    max_count=0
    #sort through each array to count the repetiontion
    sorted.each do |char|
        if char==current_char
            current_count=current_count+1
        else 
            if current_count>max_count
                max_char=current_char
                max_count=current_count
            end
            current_char=char
            current_count=1
        end
    end
    if current_count>max_count
        max_char=current_char
    end
    max_char
end


def zipHash(arr1, arr2)
    if arr1.length==arr2.length
        i=0
        hash=Hash.new
        while i<arr1.length
            hash[arr1[i]]=arr2[i]
            i=i+1
        end
    end
    hash
end

def hashToArray(hash)
    j=hash.length
    a=Array.new(j){Array.new(2)}
    i=0
    hash.each do |keys,value|
        a[i][0]=keys ; a[i][1]=value 
        i=i+1
    end
    a
end
