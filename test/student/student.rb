require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < Minitest::Test
  def setup
    @phonebook = PhoneBook.new
  end 

  def test_public_fib
      assert_equal([], fib(0))
      assert_equal([0], fib(1))
      assert_equal([0, 1], fib(2))
      assert_equal([0, 1, 1], fib(3))
      assert_equal([0, 1, 1, 2], fib(4))
      assert_equal([0, 1, 1, 2, 3], fib(5))
      assert_equal([0, 1, 1, 2, 3, 5], fib(6))
      assert_equal([0, 1, 1, 2, 3, 5, 8], fib(7))
      assert_equal([0, 1, 1, 2, 3, 5, 8, 13], fib(8))
      assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21], fib(9))
      assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34], fib(10))
  end 

  def test_public_ispalindrome
      assert_equal(true, isPalindrome(9))
      assert_equal(false, isPalindrome(3242))
      assert_equal(true, isPalindrome(11111011111))
  end 

  def test_public_nthmax
      assert_equal(5, nthmax(4, [5, 10, 15, 20, 25]))
      assert_equal(78, nthmax(1, [2, 4, 5, 7, 23, 78, 100]))
      assert_nil(nthmax(10, [0, 1, 2, 3, 4, 5, 6, 7, 8]))
  end

  def test_public_freq
      assert_equal("", freq(""))
      assert_equal("m", freq("ldfjsdhfmmmfsmadflhsagldmmmmfdsljfhqmmmfjshfmwmmmmm"))
      assert_equal("x", freq("xxxfsdfksjdfxxxfklsdjlfkjdsjsdlkfyyyyyxy"))
      assert_equal("y", freq("yxyxyxyxyxyxyxyxyxyxy"))
  end

  def test_public_ziphash
      assert_equal({}, zipHash([], []))
      assert_equal({"test" => "case"}, zipHash(["test"], ["case"]))
      assert_nil(zipHash(["Test"], ["case", "two"]))
  end

  def test_public_hashtoarray
      assert_equal([], hashToArray({}))
      assert_equal([["h", "i"], ["t", "e"]], hashToArray({"h" => "i", "t" => "e"}))
      assert_equal([["q", "w"], ["e", "r"], ["t", "y"]], hashToArray({"q" => "w", "e" => "r", "t" => "y"}))
  end

  def test_public_phonebook_add
      assert_equal(true, @phonebook.add("Test", "123-456-7890", false))
      assert_equal(false, @phonebook.add("Test1", "123-123-343", false))
      assert_equal(true, @phonebook.add("test3", "234-423-4234", true))
      assert_equal(false, @phonebook.add("test4", "234-423-4234", true))
      assert_equal(false, @phonebook.add("Test", "235-423-2342", false))
  end

  def test_public_phonebook_lookup 
      assert_equal(true, @phonebook.add("Andrew", "543-534-5342", false))
      assert_equal(true, @phonebook.add("Alex", "123-456-7890", true))
      assert_equal(true, @phonebook.add("Kevin", "098-765-4321", false))
      assert_equal(true, @phonebook.add("Ryan", "463-742-2374", true))
      assert_equal(true, @phonebook.add("Kristina", "543-534-5342", true))
      assert_nil(@phonebook.lookup("test"))
      assert_nil(@phonebook.lookup("Andrew"))
      assert_equal("543-534-5342", @phonebook.lookup("Kristina"))
  end 

  def test_public_phonebook_lookup_by_num
      assert_equal(true, @phonebook.add("Andrew", "543-534-5342", false))
      assert_equal(true, @phonebook.add("Alex", "123-456-7890", true))
      assert_equal(true, @phonebook.add("Kevin", "098-765-4321", false))
      assert_equal(true, @phonebook.add("Ryan", "463-742-2374", true))
      assert_equal(true, @phonebook.add("Kristina", "543-534-5342", true))
      assert_nil(@phonebook.lookupByNum("098-765-4321"))
      assert_equal("Kristina", @phonebook.lookupByNum("543-534-5342")) 
  end

  def test_public_name_by_ac
      assert_equal(true, @phonebook.add("Andrew", "543-534-5342", false))
      assert_equal(true, @phonebook.add("Alex", "123-456-7890", true))
      assert_equal(true, @phonebook.add("Kevin", "098-765-4321", false))
      assert_equal(true, @phonebook.add("Ryan", "463-742-2374", true))
      assert_equal(true, @phonebook.add("Kristina", "543-534-5342", true))
      assert_equal(["Ryan"], @phonebook.namesByAc("463")) 
  end
end  
