require 'node.rb'

class TreePrinter
    @root_node

    def initialize(node)
      @root_node=node
      @current_node=node
      @visited=[]
      @stack=[]
    end

   def print(node=@root_node)
     begin
       if node.class.to_s != 'Node'
         raise ArgumentError
       else
         if !@visited.include?(node.object_id)
            puts node.to_s(@stack.length)
           @visited.push node.object_id
         end
         if node.has_children?
            @stack.push node
            node.children.each do |child_node|
              if !@visited.include?(child_node.object_id)
                self.print(child_node)
              end
            end
            @stack.pop
          end
       end
     rescue ArgumentError=>e
       puts "Printer can't print DOM!\nSeems provided data is not valid XML\n\n"
     end
   end
end
