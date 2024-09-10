require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < Minitest::Test
    def setup
        @phonebook = PhoneBook.new
    end

    def test_maharjan_fib
            assert_equal([], fib(0))
            assert_equal([0], fib(1))
            assert_equal([0, 1], fib(2))
            assert_equal([0, 1, 1, 2, 3, 5, 8], fib(7))
            assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55], fib(11))
            assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144], fib(13))
            assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], fib(15))
          end
          
          
    def test_maharjan_ispalindrome
        assert_equal(true, isPalindrome(121))
        assert_equal(false, isPalindrome(123))
        assert_equal(true, isPalindrome(1221))
        assert_equal(true, isPalindrome(12321))
        assert_equal(true, isPalindrome(1))
        assert_equal(true, isPalindrome(0))
        assert_equal(false, isPalindrome(10))
        assert_equal(true, isPalindrome(123454321))
    end

    def test_maharjan_nthmax
        assert_nil(nthmax(0, []))
        assert_nil(nthmax(1,[1]))
        assert_equal(1, nthmax(0, [1]))
        assert_equal(2, nthmax(1, [1, 2, 3]))
        assert_equal(2, nthmax(1, [3, 2, 1]))
        assert_equal(4, nthmax(0, [1, 2, 3, 4]))
        assert_equal(3, nthmax(1, [4, 3, 2, 1]))
    end

    def test_maharjan_freq
        assert_equal("e", freq("beekeeper"))
        assert_equal("a", freq("amazon"))
        assert_equal("b", freq("aaabbbbbba"))
        assert_equal("a", freq("a"))
        assert_equal(" ", freq("a b c d e f g h i j k l"))
    end

    def test_maharjan_ziphash
        assert_equal({}, zipHash([], []))
        assert_equal({"a" => 1}, zipHash(["a"], [1]))
        assert_equal({"a" => 1, "b" => 2}, zipHash(["a", "b"], [1, 2]))
        assert_nil(zipHash([1], [2,3]))
    end

    def test_maharjan_hashtoarray
        assert_equal([], hashToArray({}))
        assert_equal([["a", 1]], hashToArray({"a" => 1}))
        assert_equal([["a", 1], ["b", 2]], hashToArray({"a" => 1, "b" => 2}))
        assert_equal([["i", "l"], ["j", "m"], ["k", "n"]], hashToArray({"i" => "l", "j" => "m", "k" => "n"}))
    end

    def test_maharjan_phonebook_add
        assert_equal(true, @phonebook.add("James", "786-710-5860", true))
        assert_equal(true, @phonebook.add("Jamey", "984-111-0669", false))
        assert_equal(false, @phonebook.add("James", "123-123-123", false))
        assert_equal(false, @phonebook.add("Mina", "786-710-5860", true))
        assert_equal(true, @phonebook.add("Mina", "786-710-5860", false))
        assert_equal(false, @phonebook.add("Robert", "786-710-586", false))

    end

    def test_maharjan_phonebook_lookup
        assert_equal(true, @phonebook.add("James", "786-710-5860", true))
        assert_equal(true, @phonebook.add("Jamey", "984-111-0669", false))
        assert_equal(true, @phonebook.add("Mina", "786-710-5860", false))
        assert_nil(@phonebook.lookup("John"))
        assert_nil(@phonebook.lookup("Jamey"))
        assert_equal("786-710-5860", @phonebook.lookup("James"))
    end

    def test_maharjan_phonebook_lookup_by_num
        assert_equal(true, @phonebook.add("James", "786-710-5860", true))
        assert_equal(true, @phonebook.add("Jamey", "984-111-0669", false))
        assert_equal(true, @phonebook.add("Mina", "786-710-5860", false))
        assert_nil(@phonebook.lookupByNum("786-710-5869"))
        assert_nil(@phonebook.lookupByNum("984-111-0669"))
        assert_equal("James", @phonebook.lookupByNum("786-710-5860"))
    end

    def test_maharjan_names_by_ac
        assert_equal(true, @phonebook.add("James", "786-710-5860", true))
        assert_equal(true, @phonebook.add("Jamey", "984-111-0669", false))
        assert_equal(true, @phonebook.add("Mina", "786-710-5860", false))
        assert_equal(["James", "Mina"].sort, @phonebook.namesByAc("786").sort)
        assert_equal(["Jamey"], @phonebook.namesByAc("984"))
        assert_equal([], @phonebook.namesByAc("123"))
    end
end
