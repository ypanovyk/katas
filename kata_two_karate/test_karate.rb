require 'test/unit'
require "#{File.expand_path('../',  __FILE__)}/karate.rb"

class TestKarate < Test::Unit::TestCase
def test_chop
    assert_equal(-1, kchop(3, []))
    assert_equal(-1, kchop(3, [1]))
    assert_equal(0,  kchop(1, [1]))
    #
    assert_equal(0,  kchop(1, [1, 3, 5]))
    assert_equal(1,  kchop(3, [1, 3, 5]))
    assert_equal(2,  kchop(5, [1, 3, 5]))
    assert_equal(-1, kchop(0, [1, 3, 5]))
    assert_equal(-1, kchop(2, [1, 3, 5]))
    assert_equal(-1, kchop(4, [1, 3, 5]))
    assert_equal(-1, kchop(6, [1, 3, 5]))
    #
    assert_equal(0,  kchop(1, [1, 3, 5, 7]))
    assert_equal(1,  kchop(3, [1, 3, 5, 7]))
    assert_equal(2,  kchop(5, [1, 3, 5, 7]))
    assert_equal(3,  kchop(7, [1, 3, 5, 7]))
    assert_equal(-1, kchop(0, [1, 3, 5, 7]))
    assert_equal(-1, kchop(2, [1, 3, 5, 7]))
    assert_equal(-1, kchop(4, [1, 3, 5, 7]))
    assert_equal(-1, kchop(6, [1, 3, 5, 7]))
    assert_equal(-1, kchop(8, [1, 3, 5, 7]))

    assert_equal(14, kchop(99, [1, 3, 5, 7,8,9,10,11,12,15,19,23,24,50,99]))
    #ZC12163-BXJZ-RNW3
  end
end
