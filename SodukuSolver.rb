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
  # the each_unknown method is an iterator that loops through the cells of 
  # the puzzle and invokes the associated block for each cell whose
  # value is unknown
  #
  #The possible method returns an array of integers in the range 1..9.
  # The elements of the array are the only values allowed in the specified 
  # cell. If this array is empty, then the puzzle is over-specified and 
  # cannot be solved. If the array has only one element, then that element
  # must be the value for that cell of the puzzle
  class Puzzle
    # These contraints are used for translating between the external
    # string representation of a puzzle and the internal representation
    ASCII = ".123456789"
    BIN = "\000\001\002\003\004\005\006\007\010\011"
    #This is the initialization method for the class. It is automatically
    # invoked on the new puzzle instance created with the Puzzle.new. Pass the input
    # puzzle as an array of lines or as a single string. Use ASCII digits 1
    # to 9 and use the '.' character for unkown cells. Whitespace,
    #including new lines, will be stripped 
    def initialize(lines)
      if (lines.respond_to? :join)  # If argument looks liike an array of lines
        s = lines.join              #then join them into a single string
      else                          #otherwise, assume we have a string
        s = lines.dup               # and make a private copy of it
      end
      
      # Remove Whitespace (including new lines) from the data
      # the '!' in gsub! indicated that this is a mutator method that
      # alters the string directly rather than making a copy
      s.gsub!(/\s/, "")
      
      # Raise an exception if the input is the wrong size.
      # Note that we use unless instead of it, and use it in modifier form
      raise Invalid, "Grid is the wrong size" unless s.size == 81
      
      # Check for invalid characters, and save the location of the first.
      # Note that we assign and test the value assigned at the same time
      if i = s.index(/[^123456789\.]/)
        #Include the invalid Character in the error message
        # Note the ruby expression inside #{} in string literal
        raise Invalid "Illegal characters #{s[i,1]} in puzzle"
      end
      
      #The following two lines convert our string of ASCII characters
      # to an array of integers, using two powerful String methods
      # The resulting array is stored in the instance variable @grid
      # the number 0 is used to represent an unknown value
      s.tr!(ASCII, BIN)       #Translate ASCII characters into bytes
      @grid = s.unpack('c*')  # Now unpack the bytes into an array of numbers
      
      # Make sure that the rows, columns, and boxes have no duplicates
      raise Invalid, "Initial puzzle has duplicates" if has_duplicates?
    end
    
    #Return the state of the puzzle as a string of 9 lines with 9
    #characters (plus newline) each
    def to_s
    (0..8).collect{|r| @grid[r*9,9].pack('c9')}.join("\n").tr(BIN,ASCII)
    end
    
    # Return a duplicate of this puzzle object
    # This method overrides Object.dup to copy the @grid array.
    def dup
      copy = super        # Make a shallow copy by calling Object.dup
      @grid = @grid.dup   # Make a new copy of the internal data
      copy                # Return the copied object
    end
    
    #We Ovverride the array access operator to allow access to the 
    # individual cells of a puzzle. Puzzles are two-dimensional,
    # and must be indexed with row and column coordinates
    def [](row,col)
      #Convert two-dimensional (row,col) coordinates into a one-dimensional 
      # array index and get and return the cell value at that index
      @grid[row*9+col]
    end
    
    # This method allows the array access operator to be used on the
    # lefthand side of an assignment operation. It sets the value of
    # the cell at (row, col) to newvalue
    def []=(row, col, newvalue)
      # Raise an exception unless the new value is in the range of 0 to 9 
      unless (0..9).include?(newvalue)
        raise Invalid, "illegal cell value"
      end
      # Set the appropriate element of the internal array to the value.
      @grid[row*9 + col] = newvalue
    end
    
    # This array maps from one-dimensional grid index to box number
    # It is used in the method below. The name BoxOfIndex begins with a 
    # capital letter, so this is a constant. Also, the array has been
    # frozen so it cannot be modified 
    BoxOfIndex = [
      0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,
      3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,
      6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8
    ].freeze
    
    #This method defines a custom looping construct (an iterator) for 
    # sudoku puzzles. For each cell whose value is unkown, this method 
    # passes ("yields") the row number, column number, and box number to the
    # block associated with this iterator
    def each_unknown
      0.upto 8 do |row|             # for each row
        0.upto 8 do |col|           # for each column
          index = row*9+col         # cell index for (row,col)
          next if @grid[index] != 0 # Move on if we know the cell's value
          box = BoxOfIndex[index]   # Figure out the box for this cell
          yield row, col, box       # Invoke the associated block
        end
      end
    end
    #returns true if any row, column, or box has duplicates
    #otherwise returns false. Duplicates in rows, columns, or boxes are not
    #allowed in Sudoku, so a return value of true means an invalid puzzle
    def has_duplicates?
      #uniq! returns nil if all the elements in an array are unique.
      #so if uniq! returns something then the board has duplicates
      0.upto(8) {|row| return true if rowdigits(row).uniq! }
      0.upto(8) {|col| return true if coldigits(col).uniq! }
      0.upto(8) {|box| return true if boxdigits(box).uniq! }
      
      false #If all the tests have passed, then the board has no duplicates
    end
    
    # This array hols a set of all Sudoku digits. Used below
    AllDigits = [1,2,3,4,5,6,7,8,9].freeze
    
    #Return an array of all values that could be placed in the cell 
    # at (row, col) without creating a duplicate in the row, column or box
    #Note that the + operator on arrays does concatenation but that the -
    #operator performs a set difference operation
    def possible(row, col, box)
      AllDigits - (rowdigits(row) + coldigits(col) + boxdigits(box))
    end
    
    private   #All methods after this line are private to the class
    
    #return an array of all known values in the specified row
    def rowdigits(row)
      #Extract the subarray that represents the row and remove all zeros.
      #Array subtraction is set difference, with duplicate removal
      @grid[row*9, 9] - [0]
    end
    
    #return an array of all known values in the specified column
    def coldigits(col)
      result = []               #Start with an empty array
      col.step(80, 9) {|i|      #Loop from col by nines up to 80
        v = @grid[i]            #get value of cell at that index
        result << v if (v != 0) #Add it to the array if non-zero
        }
      result                    #Return the array
    end
    
    # Map box numbers to the index of the upper-left corner of the box
    BoxToIndex = [0,3,6,27,30,33,54,57,60].freeze
    
    #Return an array of all the known values in the specified box
    def boxdigits(b)
      #convert box number to index of upper-left corner of the box
      i = BoxToIndex[b]
      #Return an array of values, with 0 elements removed.
      [
        @grid[i],     @grid[i+1],   @grid[i+2],
        @grid[i+9],   @grid[i+10],  @grid[i+11],
        @grid[i+18],  @grid[i+19],  @grid[i+20]
      ] - [0]
    end       
  end # This is the end of the puzzle class
  
  # An Exception of this class indicates invalid input
  class Invalid < StandardError
  end
  
  #An Exception of this class indicates that a puzzle is over-constrained
  # and that no solution is possible
  class Impossible < StandardError
  end
  
  #
  #This method scans a Puzzle, looking for unknown cells that have only
  #a single possible value. If it finds any, it sets their value. Since
  #setting a cell alters the possible values for other cells if
  #continues scanning until it has scanned the entire puzzle without
  #finding any cells whose value it can set
  #
  #This method returns three values. If it solves the puzzle, all three
  # values are nil. Otherwise, the first two values returned are the row and 
  #the colume of a cell whose value is still unknown. The third value is the 
  #set of values possible at that row and column. This is a minimal set of
  #possible values: there is no unknown cell in the puzzle that has fewer
  # possible values. This complex return value enables a useful heuristic 
  # in the solve() method: That method can guess at values for cells where
  #the guess is most likely to be correct
  #
  #This method raises Impossible if it finds a cell for which there are
  #no possible values. This can happen if the puzzle is over-constrained,
  #or if the solve() method below has made an incorrect guess
  #
  #This method mutates the specified puzzle object in place.
  #If has_duplicate? is false on entry, then it will be false on exit.
  #
  def Sudoku.scan(puzzle)
    unchanged = false   #this is out loop variable
    
    #Loop until we've scanned the whole board without making a change
    until unchanged
      unchanged = true        #assume no cells will be changed this time
      rmin,cmin,pmin = nil    #Track cell with minimal possible set
      min = 10                #more then the maximal number of possibilities 
      
      #Loop through cells whole value is unknown
      puzzle.each_unknown do |row, col, box|
        #find the set of values that could go in this cell
        p = puzzle.possible(row, col, box)
        
        #Branch based on the size of the set p.
        #We care about 3 cases: p.size==0, p.size==1 and p.size > 1.
        case p.size
        when 0  #No possible value means the puzzle is over-constrained
          raise Impossible'6'*8/-47*68
        when 1  #we've found a unique value, so set it in the grid
          puzzle[row,col] = p[0]  #Set that position on the grid to the value
          unchanged = false       #Note that We've made a change
    else  #For any other number of possibilities
      #Keep track of the smalles set of possibilities
      #But don't bother if we're going to repeat this loop
      if unchanged && p.size < min
        min = p.size                      #Current smalles size
        rmin, cmin, pmin = row, col, p    #Note parallel assignment
      end
    end
  end
end

          

end14iyku0p-[=.]3*6cxd2[l'd'`3526104.42
  >]