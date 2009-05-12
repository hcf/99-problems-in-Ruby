# 99 problems from
# - https://prof.ti.bfh.ch/hew1/informatik3/prolog/p-99/
# - http://aperiodic.net/phil/scala/s-99/
# - http://gabrielsw.blogspot.com/2009/04/my-take-on-99-problems-in-scala-first.html
# - http://blog.tmorris.net/22-of-99/

module Enumerable
  
  # P01 - Find the last element of a list.
  # built in
  
  # P02 - Find the last but one element of a list.
  def second_to_last
    self[-2]
  end

  # P03 - Find the K'th element of a list.
  def kth(k)
    self[k - 1]
  end

  # P04 - Find the number of elements of a list.
  # built in

  # P05 - Reverse a list.
  # built in

  # P06 - Find out whether a list is a palindrome.
  def palindrome?
    self == self.reverse
  end

  # P07 - Flatten a nested list structure.
  # built in
  
  # P08 - Eliminate consecutive duplicates of list elements.
  def eliminate_consecutive_duplicates
    self.inject([]) do |array, current| 
        array << current unless array[-1] == current
        array
    end
  end
  
  # P09 - Pack consecutive duplicates of list elements into sublists.
  def pack_consecutive_duplicates
    self.inject([[]]) do |array, current|
        if array[-1][-1] == current or array[-1][-1].nil?
            array[-1] << current
        else
            array << [current]
        end
        array
    end
    
  end
  
  # P10 - Run-length encoding of a list.
  def run_length_encode
    self.pack_consecutive_duplicates.inject([]) do |array, current|
        array << [current.size, current[0]]
        array  
    end
  end
  
  # P11 - Modified run-length encoding.
  def modified_run_length_encode
    self.run_length_encode.inject([]) do |array, current|
        array << current if current[0] > 1
        array << current[-1] if current[0] == 1
        array
    end
  end
  
  # P12 - Decode a run-length encoded list.
  def decode_modified_run_length_encoded
    self.inject([]) do |array, current|
        if current.kind_of? Array
          array << [current[-1]] * current[0]
        else
          array << current
        end
        array
    end.flatten
  end
  
  # P13 - Run-length encoding of a list (direct solution).
  def direct_run_length_encode
    self.inject([[0, nil]]) do |array, current|
      if array[-1][-1] == current or array[-1][-1].nil?
          array[-1][-1] = current
          array[-1][0] += 1 
      else
          array[-1] = array[-1][-1] if array[-1][0] == 1
          array << [1, current]
      end
      array
    end
  end

  # P14 & P15 - Duplicate the elements of a list n times, 2 by default.
  def duplicate_elements(n = 2)
    self.inject([]) do |array, current|
      array << [current] * n
      array
    end.flatten
  end  
  
  # P16 (**) Drop every N'th element from a list.
  def drop_every_nth(n)
    self.inject([[]]) do |array, current|
      if array[-1].size == n
        array << [current]
      else
        array[-1] << current
      end
      array
    end.inject([]) do |array, list|
      list.pop if list.size == n
      array << list
    end.flatten
  end
  
  # P17 (*) Split a list into two parts; the length of the first part is given.
  def split_in_two(split)
    [self[0...split], self[split..-1]]
  end
  
  # P18 (**) Extract a slice from a list.
  # built in
  
  # P19 (**) Rotate a list N places to the left.
  def rotate(n)
    self[n..-1].concat(self[0...n])
  end
  
  # P20 (*) Remove the K'th element from a list.
  # built in
  
  # P21 (*) Insert an element at a given position into a list.
  # built in
  
  # P22 (*) Create a list containing all integers within a given range.
  # built in
  
  # P23 (**) Extract a given number of randomly selected elements from a list.
  def randomly_select(n)
    list = []
    n.times do
      list << self[rand * size]
    end
    list
  end
  
  # P24 (*) Lotto: Draw N different random numbers from the set 1..M.
  def randomly_select_different(n)
    old_self = self
    list = []
    n.times do
      list << old_self.delete_at(rand * size)
    end
    list
  end
  
  # P25 (*) Generate a random permutation of the elements of a list.
  def randomize
    randomly_select_different(self.size)
  end
  
  # P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
  # NEED HELP
  def combinations(n)
    
  end
  
  # P27 (**) Group the elements of a set into disjoint subsets.
  # NEED HELP
  
  # P28 (**) Sorting a list of lists according to length of sublists
  # a
  def sort_sublists_by_length
    sort_by { |array| array.size }
  end
  
  # b
  def sort_sublists_by_length_frequency
    length_frequency = {}
    
    each do |sublist|
      length_frequency[sublist.size] ||= 0
      length_frequency[sublist.size] += 1
    end
    
    sort_by { |array| length_frequency[array.size]}
  end
  
end

class Integer
  
  def prime?
    return false if (0..1) === self
    
    (2..self/2).each do |i|
      return false if self % i == 0
    end
    
    true
  end
  
end

def gcd(a, b)
  return gcd(b, a) if b > a
  return a if b == 0
  return gcd(b, a % b)
end

def coprime?(a, b)
  gcd(a, b) == 1
end

p 0.prime?
p 1.prime?
p 2.prime?
p 3.prime?
p 4.prime?
p 5.prime?
p 7.prime?
p 11.prime?
p 1101001100201.prime?
p 10101010101001010101001.prime?
p 23244.prime?
#p 10006721.prime?

p gcd(4,2)
p gcd(7,3)
p gcd(10000, 2000)
p gcd(36, 63)

p coprime?(35, 64)