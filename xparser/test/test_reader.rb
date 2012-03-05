require 'test/unit'
require 'stringio'
require "#{File.expand_path('../../src/', __FILE__)}/reader.rb"

class TestReader < Test::Unit::TestCase
  def setup
     @data_file_path = "#{File.expand_path('../../data/', __FILE__)}/tree.xml"
  end

  def test_read_file
    args=['file', "#{@data_file_path}"]
    reader = Reader.new(args[0], args[1])
    assert reader.buffer.length > 0
  end

  def test_read_incorrect_file
    args=['file', "#{@data_file_path}bla-bla"]
    reader=nil
    out=capture_stdout do
      reader = Reader.new(args[0], args[1])
    end
    assert reader.buffer.length == 0
    assert(out.string.include?("Specified file not found"), "Expected message 'Specified file not found'")
  end

  def test_read_string
    args=['xml', @data_file_path]
    reader = Reader.new(args[0],args[1])
    assert reader.buffer.length > 0
  end

  def test_no_option
    args=[@data_file_path]
    reader = Reader.new(args[0],args[1])
    assert reader.buffer.length == 0
  end

end

module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end

end


