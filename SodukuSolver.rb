# 
# This module defines a Soduki:LPuzzle class to represent a 9X9
# Sudoku puzzle and also defines exception classes raised for
# invalid input and over-constrained puzzles. This module also defines
# the method Sudoku.solve to solve a puzzle. The solve method uses
# the Sudoku.scan method, which is also defined here
#
# Use this module to solve Sudoku puzzles with code like this:
#
# require 'Sudoku'
# puts Sudoku.solve(Sudoku::Puzzle.new(ARGF.readlines))
#
module Sudoku
  
  #
  # The Sudoku::Puzzle class represents the state of a 9X9 sudoku puzzle.
  #
  # Some definitions and termonology used in the implimentation
  #
  # - Each element of a puzzle is called a "cell"
  # - Rows and columns are numbered from 0 to 8, and the coordinates [0,0]
  #   refer to the cell in the upper-left corner of the puzzle.
  # - The nine 3X3 subgrids are known as "boxes" and are also numbered from 
  #   0 to 8, ordered from left to right top to bottom. The box in
  #   The upper-left is box 0 The box in the upper-right is box 2. The
  #   box in the middle is box 4. The box in the lower-right is box 8
  #
  # Create a new puzzle with Sudoku::Puzzle.new, Specifying the initial
  # state as a string or as an array of string. The string(s) should use
  # the characters 1 through 9 for the given values, and '.' for cells 
  # whose value is unspecified. Whitespace in the input is ignored
  #
  # Read and write access to individual cells of the puzzle is through the 
  # [] and []= operators, which expect two-dimensional [row,column] indexing.
  # These methods use numbers (not characters) 0 to 9 for cell contents
  # 0 represents an unkown value
  #
  # the has_duplicates? predicate returns true if the puzzle is invalid
  # because any row, column, or box includes the same digit twice.
  #
  #
  
  
  class Puzzle
    ASCII = ".123456789"
    BIN = "\000\001\002\003\004\005\006\007\010\011"
    def initialize(lines)
      if (lines.respond_to? :join)
        s = lines.join
      else
        s = lines.dup
      end
      
      s.gsub!(/\s/, "")
      raise Invalid, "Illegal character #{s[i,1]} in puzzle"
    end
    @grid = s.unpack('c*')
    raise Invalid, "Initial puzzle has duplicates" if has_duplicates?
  end
  
end