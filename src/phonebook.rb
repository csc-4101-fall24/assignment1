class PhoneBook
    def initialize
        #create hash to store phone numbers
        @contacts = {}

    end

    def add(name, number, is_listed)
        #check to see if the number is in format
        if !number.match?(/^\d{3}-\d{3}-\d{4}$/)
            return false
        end
        #check if the name already exists
        if @contacts.key?(name)
            return false
        end
        #check if the number exists in the book, and is listed, return false 
        #if the number already exists and the new entry has is-listed=true, 
        #proceed if the new entry has is_listed=false
        if @contacts.value?({number:number,is_listed:true})
            return false if is_listed
        end
        #add contact into the hash
        @contacts[name]={ number: number, is_listed: is_listed }
        #return true when succesfull
        true
    end

    def lookup(name)
        #get number and listing info from the phonebook
        info=@contacts[name]
        #check if the name exists, and is listed
        if info && info[:is_listed]
            info[:number]
        else
            nil
        end        
    end

    def lookupByNum(number)
        #iterate over the hash to find the phone number.
        #once found, return the name if the number is listed.
        @contacts.each do |name, details|
            if details[:number]==number && details[:is_listed]
                return name
            end
        end
        # return nil if no match
        nil
    end
    
    def namesByAc(areacode)
        #create an array to store the names
        names=[]
        #iterate over the hash to find the numbers that start with the areacode,
        #once found add them to the array "names" 
        @contacts.each do |name,details|
            if details[:number].start_with?(areacode)
                names.push(name)
            end
        end
        #return the array
        names
    end
end
