class PhoneBook
    def initialize
        @phonebook = PhoneBook.new
    end

    def add(name, number, is_listed)
        is_listed == false
        @phonebook[name] = number
    end

    def lookup(name)
        @phonebook[name]
    end

    def lookupByNum(number)
        @phonebook[number]
    end

    def namesByAc(areacode)
        
    end

end
