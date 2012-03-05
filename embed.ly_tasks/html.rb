#One way to exclude miscellaneous text from an article is to find the standard deviation of the depth of the <p> tags for the <article>. For the following HTML we can draw a depth tree like so.

# <article>
#   <p>Sign Up Today</p>
#   <div>
#     <p>Content</p>
#     <div>
#      <img />
#      <p>Img Caption</p>
#     </div>
#     <p>Content</p>
#   </div>
#  </article>

# article - 0
#    p - 1
#    div - 1
#      p - 2
#      div - 2
#        img - 3
#        p - 3
#      p - 2

#For http://apply.embed.ly/static/data/2.html find the standard deviation of all the <p> tags within the <article> tag. Round to the nearest tenth: X.X.
require 'rubygems'
require 'nokogiri.rb'
require 'open-uri'



#variables initializing
#sum of count of <p> elements found by that time
found_p_count=0

xpath='//article/p'
#current depth level we are working on
level=1

#results of page parsing
doc_result = Hash.new

#depth polulation
result=[]

#method modifies xpath:
#//article/p=>//article/*/p=>//article/*/*/p.......
def level_down(s)
return s.split("/").insert(-2, "*").join("/")
end

class Array
  def avg
    sum.to_f/self.length
  end

  def sum
    sum=0
    self.each do |el|
      sum+=el
    end
   return sum
  end
end



doc = Nokogiri::HTML(open("http://apply.embed.ly/static/data/2.html"))

#get count of all <p> elements on the page
all_p_count= doc.xpath('//p').count

#loop while find all <p> elements on various levels
while found_p_count<all_p_count
  found = doc.xpath("#{xpath}").count
  puts "level="+level.to_s+"    "+"found="+found.to_s

  #store results in hash
  doc_result["#{level}"]=found

  found_p_count=found_p_count+found
  xpath= level_down(xpath)
  level+=1
end

#populate result array with results of page parsing
#we will get depth population
doc_result.each do |key, value|
  value.times {result<<key.to_i}
end

p "depth population="+result.to_s
avg=result.avg
#avg=avg(result.values)
p "avg="+avg.to_s
#standart deviation
#1.each element: (el-avg) and square
#2.average of resulted elements
#3. square root of step#2
dev=Math.sqrt(result.collect{|el| (el-avg)**2}.sum/result.length)

p "standard deviation="+dev.to_s
