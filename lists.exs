list = [1, "hi", :atom]
IO.inspect length(list)
IO.puts Enum.at(list,1)
#lists have recursive nature
#head = first in list, tail = rest of list
IO.inspect hd(list)
IO.inspect tl(list)

list = [ 250 | list]
IO.inspect list
