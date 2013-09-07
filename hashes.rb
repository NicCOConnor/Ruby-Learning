h1 = Hash.new()
h2 = Hash.new("Some Kind of Ring")

h2['treasure1'] = 'Silver ring'
h2['treasure2'] = 'gold ring'
h2['treasure3'] = 'Ruby ring'
h2['treasure4'] = 'sapphire ring'
  
#Shorthand Hash <-- Probablly more common
  h1 = {  'room1'=>'The Treasure Room',
          'room2'=>'The Throne Room',
          'loc1'=>'A Forest Glade',
          'loc2'=>'A Mountain Stream' 
  }
  
  #Objects or Classes can be defined as keys
  #x1 = X.new('My Xobject')
  #h2[x1] = 'Diamond Ring'
  
  
  #Accessing or Indexing into a HASH
  puts(h1['room2'])
  puts(h1['unknown_room']) # Previously undefined 
  puts(h2['unkown_treasure']) # Display HASH default value
    
  #copying a Hash
  #This is a reference to the same hash
  h4 = h1
  h4['room1']='A New Room'
  puts(h1['room1'])
  
  #This is a clone / copy
  h5 = h1.clone()
  h5['room1'] = 'An even newer room'
  puts(h1['room1'])
  puts(h5['room1'])
  
  #Sorting a hash
  def sorted_hash
    return aHash.sort{
      |a,b|
      a.to_s <=> b.to_s
    }
  end
  
#Some HASH methods
hash1 = {'key1'=>'val1', 'key2'=>'val2','key3'=>'val3','key4'=>'val4'}
hash2 = {'key1'=>'val1','KEY_TWO'=>'val2','key3'=>'VALUE_3','key4'=>'val4'}
  
p(hash1.keys() & hash2.keys())  #seems to print keys that are the same

p(hash1.values() & hash2.values()) #seems to print values that are the same

p(hash1.keys()+hash2.keys())                #concatination

p(hash1.values()-hash2.values())            #Difference
p((hash1.keys()<<hash2.keys()))             #Append
p((hash1.keys()<<hash2.keys()).flatten.reverse)   #un-nest arrays and reverse

#Matricies and Vectors
require "Matrix"

m1 = Matrix[  [1,2,3,4],
              [5,6,7,8],
              [9,10,11,12],
              [13,14,15,16]   ]
m2 = Matrix[  [10,20,30,40],
              [50,60,70,80],
              [90,100,110,120],
              [130,140,150,160]   ]           

m3 = m1+m2 #Added up the individual matrix numbers
p(m3)

v = Vector[1,2,3,4,5]
v2 = Vector[6,7,8,9,10]
m4 = Matrix.columns([v,v2]) #Took the two vectors and grouped the numbers by colums interesting.
p(m4)

#Sets - A collection of unordered values with no duplicates
require "Set"
s1 = Set.new([1,2,3,4,5,2])
s2 = Set.new([1,1,2,3,4,4,5,1])
s3 = Set.new([1,2,100])
weekdays = Set.new( %w( Monday Tuesday Wednesday Thursday Friday Saturday Sunday))
print "Set1: "
p(s1)
print "Set2: "
p(s2)
print "Set1 == Set2: "
p(s1 == s2)
print "Set1 == set3: "
p(s1==s3)
print "Set1 Add(1): "
p(s1.add(1))
print "Set1 Add(1000): "
p(s1.add( 1000 ))
print "Set1 Merge Set2: "
p(s1.merge(s2))
print "Weekdays: "
p(weekdays)  

  
  
  
  

 
  
    
    
    
    
    
    