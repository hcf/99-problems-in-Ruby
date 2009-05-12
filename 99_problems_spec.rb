require 'rubygems'
require 'spec'
require '99_problems'

describe "P01-P05" do
  before(:each) do
    @list = %w{a b c d e f g h i j k l}
  end
  
  it "P01 should find the last element of a list" do
    @list.last.should == "l"
  end
  
  it "P02 should find the last but one element of a list" do
    @list.second_to_last.should == "k"
  end
  
  it "P03 should find the kth element of a list" do
    @list.kth(3).should == "c"
  end
  
  it "P04 should find the number of elements of a list" do
    @list.size.should == 12
  end
  
  it "P05 should reverse a list" do
    @list.reverse.should == %w{l k j i h g f e d c b a}
  end
  
end

describe "P06" do
  it "P06 should return true if the list is a palindrome" do
    list = %w{a b c d e d c b a}
    
    list.palindrome?.should == true
  end
  
  it "P06 should return false if the list is not a palindrome" do
    list = %w{a b c d e f g h i j k l}
    
    list.palindrome?.should == false
  end
end

describe "P07" do
  it "P07 should flatten a nested list structure" do
    list = [1,2,[3,[4,[5]]],6,[7,8],9]
    
    list.flatten.should == [1,2,3,4,5,6,7,8,9]
  end
end

describe "P08-P27" do
  before(:each) do
    @list = %w{a a a b b b b c a a}
  end
  
  it "P08 should eliminate consecutive duplicates of list elements" do
    @list.eliminate_consecutive_duplicates.should == %w{a b c a}
  end
  
  it "P09 should pack consecutive duplicates of list elements into sublists" do
    @list.pack_consecutive_duplicates.should == [%w{a a a}, %w{b b b b}, %w{c}, %w{a a}]
  end
  
  it "P10 should be able to run-length encode a list" do
    @list.run_length_encode.should == [[3, "a"], [4, "b"], [1, "c"], [2, "a"]]
  end
  
  it "P11 should be able to modified run-length encode a list" do
    @list.modified_run_length_encode.should == [[3, "a"], [4, "b"], "c", [2, "a"]]
  end
  
  it "P12 should be able to decode a modified run-length encoded list" do
    modified_run_length_encoded_list = @list.modified_run_length_encode
    
    modified_run_length_encoded_list.decode_modified_run_length_encoded.should == @list
  end
  
  it "P13 should be able to run-length encode a list directly" do
    @list.direct_run_length_encode.should == [[3, "a"], [4, "b"], "c", [2, "a"]]
  end
  
  it "P14 should duplicate the elements of a list" do
    @list.duplicate_elements.should == %w{a a a a a a b b b b b b b b c c a a a a}
  end
  
  it "P15 should duplicate the elements n times" do
    @list.duplicate_elements(3).should == %w{a a a a a a a a a b b b b b b b b b b b b c c c a a a a a a}
  end
  
  it "P16 should drop every nth element of a list" do
    @list.drop_every_nth(3).should == %w{a a b b b c a}
    @list.drop_every_nth(2).should == %w{a a b b a}
    @list.drop_every_nth(1).should == %w{}
  end
  
  it "P17 should split a list into two parts; the length of the first part is given." do
    x, y = @list.split_in_two(4)
    
    x.should == %w{a a a b}
    y.should == %w{b b b c a a}
  end
  
  it "P18 should extract a slice from a list" do
    @list[2...5].should == %w{a b b}
  end
  
  it "P19 should rotate a list N places to the left" do
    @list.rotate(3).should == %w{b b b b c a a a a a}
    @list.rotate(-2).should == %w{a a a a a b b b b c}
  end
  
  it "P20 should be possible to remove the kth element" do
    @list.delete_at(3)
    @list.should == %w{a a a b b b c a a}
  end
  
  it "P21 should be possible to insert an element at a given position into a list" do
    @list.insert(3, "h").should == %w{a a a h b b b b c a a}
  end
  
  it "P22 should be possible to create a list containing all integers within a given range" do
    (1..10).to_a.should == [1,2,3,4,5,6,7,8,9,10]
  end
  
  it "P23 should be possible to extract a given number of randomly selected elements from a list" do
    list_1 = @list.randomly_select(5)
    list_2 = @list.randomly_select(5)
    
    list_1.size.should == 5
    list_2.size.should == 5
    
    list_1.should_not == list_2
  end
  
  it "P24 should be possible to draw N different random numbers from the set 1..M" do
    list = (1..37).to_a
    
    picked = list.randomly_select_different(7)
    
    picked.size.should == 7
    
    picked.all? do |number|
      (1..37) === number
    end.should == true
  end
  
  it "P25 should be possible to create a random permutation of a list" do
    @list.randomize.should_not == @list
  end
  
  it "P26 should be possible to generate the combinations of K distinct objects chosen from the N elements of a list" do
    list = [1,2,3,4]
    
    list.combinations(2).should == [[1,2], [1,3], [1,4], [2,3], [2,4], [3,4]]
    
    list.combinations(3).should == [[1,2,3], [1,2,4], [1,3,4], [2,3,4]]
    
    list.combinations(4).should == [[1,2,3,4]]
  end
  
 
  
  
end

describe "P27" do
  before(:each) do
    @list = %{aldo beat carla david evi flip gary hugo ida}
  end
  
  
  it "P27a should be possible to generate all possible groups 9 people can work in, with 2,3 and 4 persons" do
    fail
  end
  
  it "P27b should be possible to generate all possible groups people can work in" do
    fail
  end
end

describe "P28" do
  
  before(:each) do
    @list = [%w{a b c},%w{d e},%w{f g h},%w{d e},%w{i j k l},%w{m n},%w{o}]
  end
  
  it "P28a should be able to sort a list of lists according to the length of the lists" do
    @list.sort_sublists_by_length.should == [%w{o},%w{d e},%w{m n},%w{d e},%w{a b c},%w{f g h},%w{i j k l}]
  end
  
  it "P28b should be able to sort a list of lists according to the length frequency of the lists" do
    @list.sort_sublists_by_length_frequency.should == [%w{o},%w{i j k l},%w{f g h},%w{a b c},%w{d e},%w{m n},%w{d e}]
  end
  
end