class Node

  attr_accessor :name, :text, :children

  def initialize(name,text,children=nil)
    @name=name
    @text= text
    @children=Array.new
    if children !=nil
      children.each do |child|
        add_child child
      end
    end
  end

  def add_child(object)
    @children.push object
  end

  def has_children?
    if @children.size !=0
      return true
    else
      return false
    end
  end

  def to_s(level=0)
    node_string=""
    level_spaces=""
    level.times {level_spaces+="   "}
    node_string+=level_spaces+"Name: "+@name+"\n"
    node_string+=level_spaces+"Text: "+@text+"\n"
    node_string+=level_spaces+"children:"+@children.size.to_s+"\n"
    node_string+=level_spaces+"-------------"+"\n"
  end
end

