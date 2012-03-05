#usage ruby parse_xml.rb --file Property\ transfer-soapui-project.xml
# ruby parse_xml.rb --xml "<xml> <node>RootI <node>Level1 <node>Level2 <leaf>I12Text1</leaf> </node> <leaf>I1Text1</leaf> <leaf>I1Text2</leaf> </node> </node> <node>RootII</node> <node>RootIII</node> <node>RootIV <node>Level1</node> <node>Level1</node> <leaf>I1Text1</leaf> <leaf>I1Text2</leaf> </node> </xml>"

require 'reader.rb'
require 'xparser.rb'
require 'optparse'

optparse = OptionParser.new do|opts|
  opts.banner = "Usage: #{__FILE__} [options] file|xml\nTry this: ruby #{__FILE__} --file tree.xml"

  opts.on_head( '', 'help' ) do
     puts opts
     exit
   end

  opts.on_head( '-h', '--help', 'help' ) do
     puts opts
     exit
   end

  opts.on('-x','--xml STRING','parse xml string') do |s|
    parse_xml('xml', s)
    exit
  end

  opts.on('-f','--file FILE','parse xml file') do |f|
    parse_xml('file', f)
    exit
  end

end

def parse_xml(option, xml)
  input_string = Reader.new(option, xml).buffer
  parser=XParser.new
  parser.parse(input_string)
  parser.printDom
end

begin
  optparse.parse!()
rescue OptionParser::InvalidOption
  puts "You provide invalid option.\nPlease use '#{__FILE__} -h' option to see list of allowed options\n\n"
rescue OptionParser::MissingArgument
  puts "You do not specify file or xml string. Sorry, but there is nothing to parse.\n\n"
end


