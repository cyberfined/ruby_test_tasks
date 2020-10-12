#!/usr/bin/env ruby

order = Hash.new
loop do
  title = gets.strip
  if title == "стоп"
    break
  end

  cost = gets.strip.to_f
  count = gets.strip.to_f

  if not order.keys.include?(title)
    order[title] = Hash.new(0)
  end
  order[title][cost] += count
end

totalCost = 0
order.each do |prod, costs|
  puts "#{prod}:"
  totalProd = 0
  costs.each do |cost, count|
    totalProd += cost * count
    puts "\tCost #{cost}: count #{count}"
  end
  totalCost += totalProd
  puts "\tTotal cost for #{prod}: #{totalProd}"
end

puts "Total cost for all products: #{totalCost}"
