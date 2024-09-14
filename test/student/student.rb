require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < Minitest::Test
  def setup
    @phonebook = PhoneBook.new
  end 

  def test_public_fib
  end 

  def test_public_ispalindrome
  end 

  def test_public_nthmax
  end

  def test_public_freq
  end

  def test_public_ziphash
  end

  def test_public_hashtoarray
  end

  def test_public_phonebook_add
  end

  def test_public_phonebook_lookup 
  end 

  def test_public_phonebook_lookup_by_num
  end

  def test_public_name_by_ac
  end
end  
