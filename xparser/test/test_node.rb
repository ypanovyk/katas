require 'test/unit'
require "#{File.expand_path('../../src/', __FILE__)}/node.rb"


class TestNode < Test::Unit::TestCase

  def setup
    @node=Node.new('test_node','text of test node')
  end

  def test_create
    assert @node.class == Node
    assert @node.name == 'test_node'
    assert @node.text == 'text of test node'
    assert @node.has_children? == false
  end

  def test_add_children
    @node.add_child(Node.new('child_node','text of child node'))
    assert @node.has_children? == true
    assert @node.children[0].name == 'child_node'
  end

  def test_create_with_children
    node=Node.new('parent_node','text of parent node',[@node])
    assert node.class == Node
    assert node.name == 'parent_node'
    assert node.text == 'text of parent node'
    assert node.has_children? == true
    assert node.children[0].name =='test_node'
  end

  def test_to_s
    string =%{Name: test_node\nText: text of test node\nchildren:0\n-------------\n}
    assert @node.to_s==string, "expected\n #{string} but was #{@node.to_s}"
  end

end
