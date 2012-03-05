class Reader
  attr_reader :buffer

  def initialize(option,string)
      @buffer=''
     if option=='file'
       begin
         File.open(string) do |f|
           while line=f.gets
             @buffer<<line
           end
         end
       rescue
         puts "Specified file not found."
       end
     elsif option=='xml'
       @buffer=string
     end
     return @buffer
  end

  def print_buffer
    p @buffer
  end

end
