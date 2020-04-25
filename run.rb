require 'pry'

require_relative "lib/cat"
require_relative "lib/dog"
require_relative "lib/owner"


o1=Owner.new("salim", "cat")
o2=Owner.new("ali", "dog")
o3=Owner.new("rafiq", "mouse")

c1=Cat.new("kali", o1)
c2=Cat.new("lilly", o2)
c3=Cat.new("pilly", o3)

d1=Dog.new("mali", o2)
d2=Dog.new("jali", o1)
d3=Dog.new("lali", o3)

binding.pry
0