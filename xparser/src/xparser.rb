require 'tree_printer.rb'


class XParser

  def initialize()
   @in_lexema=false
   @new_tag=""
   @stack = Array.new
   @inner_text=""
   @node=nil
  end

  def parse(string)
    string.each_char do |char|

      if char=="\n"
        next
      end

      if char=='<'
        @in_lexema=true
        if @inner_text.strip !=""
          @node.text=@inner_text.strip
        end
        @inner_text=""
        next
      end

      if char=='>'
        @in_lexema=false
        if @new_tag.match /^\/.*/
          if @stack.length>1
            @stack.pop
          end
        else
          @node=Node.new(@new_tag,"")
          if @stack.length!=0
            @stack.last.add_child @node
          end
          @stack.push @node
        end
        @new_tag=""
        next
      end

      if @in_lexema==false
       @inner_text=@inner_text+char
      end

      if @in_lexema==true
        @new_tag=@new_tag+char
      end

    end
  end

  def printDom()
    TreePrinter.new(@stack.last).print
  end
end


