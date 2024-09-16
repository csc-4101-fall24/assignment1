def fib(n)
    if n == 1
        puts 0
    else
        fib = [0,1]
        (n-2).times do
            fib << fib[-1] + fib[-2]
        end
        puts "[" + fib.join(', ') + "]"
    end
end
# fib(10)
def isPalindrome(n)
    puts n.to_s == n.to_s.reverse

end
# isPalindrome(101)

def nthmax(n, a)
    puts   a.sort[n-1]
end
# nthmax(0, [1,2,3,0])

def freq(s)
    if s.length == 0
        puts s
    else
        result = s.scan(/((.)\2*)/).group_by{|s, c| s.length}.sort_by(&:first).last.last.map(&:last)
        puts result.to_s
    end
end
# freq("a12xxxxxyyyxyxyxy")
def zipHash(arr1, arr2)
end

def hashToArray(hash)
    puts array_of_values = hash.values.to_s

end
