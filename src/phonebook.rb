class PhoneBook
    def initialize
      @nameHash = Hash.new
      @phoneHash = Hash.new 
    end

    def add(name, number, is_listed)
      if @nameHash[name].nil? && number =~ /\d{3}-\d{3}-\d{4}/ && (@phoneHash[number].nil? ? true : @phoneHash[number][1] == false) then         
        @nameHash[name] = [number, is_listed]
        @phoneHash[number] = [name, is_listed]
        return true
      end 
      return false
    end

    def lookup(name)
      if !@nameHash[name].nil? && @nameHash[name][1]
        return @nameHash[name][0]
      end 
      return nil
    end

    def lookupByNum(number)
      if !@phoneHash[number].nil? && @phoneHash[number][1]
        return @phoneHash[number][0]
      end
     return nil 
    end

    def namesByAc(areacode)
      arr = Array.new 
      i = 0
      for num in @phoneHash.keys 
        if num[0, 4].include?(areacode)
          arr[i] = @phoneHash[num][0]
          i = i + 1
        end 
      end 
      return arr 
    end
end
