#!/usr/bin/env ruby
numbers = $stdin.read.split.map(&:to_i)
a, b, c = numbers[0], numbers[1], numbers[2]

d = b*b - 4*a*c
if d > 0
  ds = Math.sqrt(d)
  x1 = (-b + ds) / (2*a)
  x2 = (-b - ds) / (2*a)
  puts "D = #{d} x1 = #{x1} x2 = #{x2}"
elsif d == 0
  x = b/(2*a)
  puts "D = 0 x = #{x}"
else
  puts "D = #{d} => корней нет"
end
