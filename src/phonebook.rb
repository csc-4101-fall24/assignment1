class PhoneBook
    def initialize
    @phonebookHash = {}
    end

    def add(name, number, is_listed)
       
        if @phonebookHash.key?(name)
        return false
       
        elsif number.length != 12
        return false
       
        else
        if @phonebookHash.any? {|nameCheck, numEntry| numEntry[:number] == number && numEntry[:listed]}
        return false
        
        else
        @phonebookHash[name] = {number: number, listed: is_listed }
        return true
        end
    end
    end

    def lookup(name)
        
        if @phonebookHash.has_key?(name)
            if @phonebookHash[name][:listed] == false
        return nil
        
        else
        return @phonebookHash[name][:number]
        end
        
        else 
        return nil
        end 
   
    end

    def lookupByNum(number)
       
    @phonebookHash.each do |name, value |
            if value[:number] == number && value[:listed]
            return name
            end
        end
     return nil
     end
    
    def namesByAc(areacode)
        acmatchednames = []
    @phonebookHash.each do |name, value |
        if value[:number][0, 3] == areacode
        acmatchednames << name
        
        end
        end
        
        
    return acmatchednames
    end
    
    
end
