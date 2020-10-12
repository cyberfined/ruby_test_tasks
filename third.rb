#!/usr/bin/env ruby

def calcDeterm(matrix)
  if matrix.length == 2
    return matrix[0][0]*matrix[1][1] - matrix[0][1]*matrix[1][0]
  elsif matrix.length == 1
    return matrix[0][0]
  end

  determ = 0
  for i in 0..matrix[0].length-1
    subMatrix = matrix[1..-1].map{|r| r.select.with_index {|v,ind| ind != i}}
    sgn = i % 2 == 0 ? 1 : -1
    determ += sgn*matrix[0][i]*calcDeterm(subMatrix)
  end

  return determ
end

isEmptyLine = false
curRow = ""
matrix = []
while line=gets
  if line.strip.empty?
    if not curRow.strip.empty?
      matrix.push curRow.split(",").map(&:to_i)
      curRow = ""
    end
    if isEmptyLine
      break
    else
      isEmptyLine = true
    end
  else
    isEmptyLine = false
  end
  curRow += line
end

if matrix.length > 0
  numRows = matrix.length
  numCols = matrix[0].length
  if matrix.any?{|c| c.length != numCols}
    puts "Error: matrix rows must have the same sizes"
    exit 0
  end

  if numRows == numCols
    determ = calcDeterm matrix
    puts "Determinant is #{determ}"
  end
end
