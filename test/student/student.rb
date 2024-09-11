require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < Minitest::Test
    def setup
        @phonebook = PhoneBook.new
    end

    def test_public_fib
       assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], fib(15))
       assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181], fib(20))
       assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368], fib(25))
       assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229], fib(30))
    end

    def test_public_ispalindrome
       assert_equal(true, isPalindrome(111111111111))
        assert_equal(false, isPalindrome(1234567890))
        assert_equal(true, isPalindrome(10000000000001))
        assert_equal(false, isPalindrome(43110))
        assert_equal(true, isPalindrome(167761))
    end

    def test_public_nthmax
        assert_equal(4, nthmax(3, [10,4,2,62,8]))
        assert_equal(9, nthmax(0, [1,7,5,9,3]))
        assert_equal(1, nthmax(0, [1,1,1,1,1,1,1,1,1]))
        assert_equal(1450, nthmax(1, [0,1,50,62,12,50,1401,1450,1760,144,245,1341,553]))
        assert_nil(nthmax(10, [1,1,1,1,1,1]))
    end

    def test_public_freq
        assert_equal("b", freq("zbbazbburubwbehnwbebbhdnandababbsdbbbn"))
        assert_equal("z", freq("jfhehwhzkzzzzz"))
        assert_equal("d", freq("djalsdhk1230dhalkndaljhddd-0123u90dalkdj198y31d;ljdddddd123213pidml2d"))
        assert_equal("v", freq("djalskjdliwhruehfbvlnlkvvbeuvbesvblasvbeuvbevvva;hjeihf;aivvavhowudhaldjavvvahvhvawlilhdvv"))
        assert_equal("a", freq("2a938au198rya921aaa8na912n9a2vn2a97gb29vb293gh2a9aa3f120af2h8fh20afh20fah23afh84ahgfaaa0238fh0a82hfa0283aifh"))
    end

    def test_public_ziphash
        assert_equal({}, zipHash([], []))
        assert_equal({1 => 2, 3 => 4, 5 => 6, 7 => 8, 9 => 10}, zipHash([1,3,5,7,9], [2,4,6,8,10]))
        assert_equal({1 => 1, 1 => 1, 1 => 1}, zipHash([1, 1, 1], [1, 1, 1]))
        assert_nil(zipHash([0], [1,2,3,4,5,6,7,8,9,10]))
        assert_equal({"Ethan" => "Student", "Brandon" => "Student", "Evan" => "Student"},
                      zipHash(["Ethan", "Brandon", "Evan"], ["Student", "Student", "Student"]))
    end

    def test_public_hashtoarray
       assert_equal([["a", "b"]], hashToArray({"a" => "b"}))
        assert_equal([[3, 4]], hashToArray({3 => 4}))
        assert_equal([[321321, 123123], [4543, 2323]], hashToArray({321321 => 123123, 4543 => 2323}))
        assert_equal([["zzz", "yyy"], ["www", "xxx"], ["111", "222"]], hashToArray({"zzz" => "yyy", "www" => "xxx", "111" => "222"}))
    end

    def test_public_phonebook_add
        assert_equal(true, @phonebook.add("Ethan", "457-371-5643", true))
        assert_equal(true, @phonebook.add("Brandon", "123-431-7473", false))
        assert_equal(false, @phonebook.add("Evan", "457-371-5643", true))
        assert_equal(false, @phonebook.add("Bob","1231231312312321313213", false))
     end

    def test_public_phonebook_lookup
        assert_equal(true, @phonebook.add("Ethan", "457-371-5643", true))
        assert_equal(true, @phonebook.add("Brandon", "123-431-7473", true))
        assert_equal(false, @phonebook.add("Evan", "457-371-5643", true))
        assert_equal(false, @phonebook.add("Bob","1231231312312321313213", false))
    
        assert_nil(@phonebook.lookup("Chris"))
        assert_nil(@phonebook.lookup("Bob"))
        assert_equal("457-371-5643", @phonebook.lookup("Ethan"))
        assert_equal("123-431-7473", @phonebook.lookup("Brandon"))
    end

    def test_public_phonebook_lookup_by_num
        assert_equal(true, @phonebook.add("Ethan", "457-371-5643", true))
        assert_equal(true, @phonebook.add("Brandon", "123-431-7473", true))
        assert_equal(false, @phonebook.add("Evan", "457-371-5643", true))
        assert_equal(false, @phonebook.add("Bob","1231231312312321313213", false))
   
        assert_equal("Ethan", @phonebook.lookupByNum("457-371-5643"))
        assert_equal("Brandon", @phonebook.lookupByNum("123-431-7473"))
        
        assert_nil(@phonebook.lookupByNum("1231231312312321313213"))
        assert_nil(@phonebook.lookupByNum("1983198"))
    end

    def test_public_names_by_ac
        assert_equal(true, @phonebook.add("Ethan", "457-371-5643", true))
        assert_equal(true, @phonebook.add("Brandon", "123-431-7473", true))
        assert_equal(true, @phonebook.add("Evan", "457-372-5643", true))
        assert_equal(false, @phonebook.add("Bob","1231231312312321313213", false))
    
        assert_equal(["Ethan", "Evan"].sort, @phonebook.namesByAc("457").sort)
        assert_equal(["Brandon"], @phonebook.namesByAc("123"))
        assert_equal([], @phonebook.namesByAc("5747324"))
    end
end
