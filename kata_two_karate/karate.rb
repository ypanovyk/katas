def pre_chop(integer,array, start_pos, end_pos)
  #do if array has more that one element
  if start_pos!=end_pos
    #divide search range
    length=end_pos/2
    #given array [1,3,5,7]
    #and we are looginf for 7
    #on iteration #2 we have start_pos=2 and end_pos=3
    #when divide this range we will have length=1 (end_pos/2=1)
    #so we should do:
    length=start_pos if length<=start_pos
    #to compre elements correctly
    if integer<=array[length]
      pre_chop(integer,array,start_pos,length)
    else
      pre_chop(integer,array,length+1,end_pos)
    end
  #do if arra has only one element
  else
     # return position if it is element we are looking for
     if integer== array[start_pos]
       return  start_pos
     #return -1: there is no element in array we are looking for
     else
       return -1
     end
  end
end
#array=[1,3,5,7,9]

#p chop(7,array)

def chop(integer,array)
  #if array is empty return -1
  if array.length==0
   return -1
 end
  pre_chop(integer,array,0,array.length-1)

end
