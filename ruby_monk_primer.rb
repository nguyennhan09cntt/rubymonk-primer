# Problem Statement
# Create a class Calculator, which performs addition and subtraction of two numbers at a time.
class Calculator
  def add(a, b)
   a+b
  end

  def subtract(a, b)
   a-b
  end
end

# Problem Statement
# Given an array containing some strings, return an array containing the length of those strings.
def length_finder(input_array)
  #input_array.map { |s| s.length }
  input_array.map(&:length)
end

# Problem Statement
# Given a sentence containing multiple words, find the frequency of a given word in that sentence.
# 
# Construct a method named 'find_frequency' which accepts two arguments 'sentence' and 'word', 
# both of which are String objects.
#
# Example: The method, given 'Ruby is The best language in the World' and 'the', should return 2 
# (comparison should be case-insensitive).
def find_frequency(sentence, word)
  sentence.split.map { |w| w.downcase }.count(word.downcase)
end

# Problem Statement
# Create a method named 'sort_string' which accepts a String and rearranges all 
# the words in ascending order, by length. Let's not treat the punctuation marks 
# any different than other characters and assume that we will always have single 
# space to separate the words.
#
# Example: Given a string "Sort words in a sentence", it should return "a in Sort words sentence".
def sort_string(string)
  string.split.sort { |w1,w2| w1.length <=> w2.length }.join(" ")
end

# Problem Statement
# Create a method 'random_select' which, when given an array of elements (array) and 
# a number (n), returns n randomly selected elements from that array.
#
# Example: Given an array [1, 2, 3, 4, 5] and 2 should return two random numbers from 
# the given array. (Note: those two random numbers may be the same number.) The method 
# should return those random values in a new array.
#
# Calling the method twice should ideally return different sets of values (though it may not).
#
# Note: Ruby has a method Array#sample which very concisely solves this problem. Unfortunately, 
# it's too concise! The exercise is almost to write your own Array#sample, so it's been disallowed.
def random_select(array, n)
=begin
  rand_elements = []
  n.times do
    rand_elements << array[rand(array.length-1)]
  end
  rand_elements
=end
  array.shuffle.sample(n)
end

# Problem Statement
# Let us say you are trying to recruit team-members for your new startup! 
# Given a candidate, you need an expression that will tell you whether 
# they fit into certain types. This is how a candidate object would look:
#
# candidate.years_of_experience = 4
#   candidate.github_points = 293
#   candidate.languages_worked_with = ['C', 'Ruby', 'Python', 'Clojure']
#   candidate.applied_recently? = false
#   candidate.age = 26
# 
# We are looking to hire experienced Ruby programmers. Our ideal candidate
# has 2 or more years of experience, but some programmers become really 
# good even before that. We'll consider their Github points (a nice 
# indicator of a good programmer), and even if they are not experienced, 
# candidates with 500 Github points or more can apply. And there is one 
# more catch: Ruby being a cool and awesome language, a lot of smart 
# youngsters are very good at it. We love those kids, but for this 
# particular job we'd rather have them study at school than work. Let us 
# filter out candidates who are younger than 15. Also we don't want to 
# consider candidates who applied recently for this opening.
is_an_experienced_programmer = (candidate.years_of_experience >= 2 or candidate.github_points >= 500) and candidate.languages_worked_with.include?('Ruby') and candidate.age >= 15 and not(candidate.applied_recently?)

# Problem Statement
# Given a sentence, return true if the sentence is a palindrome.
#
# You are supposed to write a method palindrome? to accomplish this task.
#
# Note Ignore whitespace and cases of characters.
#
# Example:
# Given "Never odd or even" the method should return true
def palindrome?(sentence)
  clean_sentence = sentence.downcase.gsub(/\W/, "")
  clean_sentence == clean_sentence.reverse
end

# Problem Statement
# Compute the sum of cubes for a given range a through b.
#
# Write a method called sum_of_cubes to accomplish this task
#
# Example Given range 1 to 3 the method should return 36
def sum_of_cubes(a, b)
=begin  
  sum = 0
  (a..b).each do |n|
    sum += n*n*n
  end
  sum
=end  
  (a..b).reduce(0) { |a, b| a + b ** 3 }
end

# Problem Statement
# Given an Array, return the elements that are present exactly once in the array.
#
# You need to write a method called non_duplicated_values to accomplish this task.
#
# Example: Given [1,2,2,3,3,4,5], the method should return [1,4,5]
def non_duplicated_values(values)
  values.keep_if { |v| values.count(v) == 1 }
end

# Problem Statement
# Given an array, return true if all the elements are Fixnums.
#
# You need to write array_of_fixnums? method to accomplish this task.
#
# Example:
# Given [1,2,3], the method should return true
def array_of_fixnums?(array)
  #array.select { |e| e.is_a?(Fixnum) } == array
  array.all?{|e| e.is_a?(Fixnum)}
end

# Problem Statement
#
# 9 is a Kaprekar number since 
# 9 ^ 2 = 81 and 8 + 1 = 9
#
# 297 is also Kaprekar number since 
# 297 ^ 2 = 88209 and 88 + 209 = 297.
#
# In short, for a Kaprekar number k with n-digits, if you square it and add the right n digits to the left n or n-1 digits, the resultant sum is k. 
# Find if a given number is a Kaprekar number.
def kaprekar?(k)
=begin
  sqr = k**2
  digits = k.to_s.length
  right_n_digits = sqr.to_s[(0-digits)..-1].to_i
  left_digits = sqr.to_s[0..(1-digits)].to_i
  left_digits + right_n_digits == k
=end
  n = Math.log10(k).to_i + 1
  value = k**2  
  k == value % (10**n) + value / (10**n)  
end

# Problem Statement
# For 2 Colors in RGB: 
# (R1, G1, B1) and (R2, G2, B2),
#
# Brightness index is: 
# ( 299*R1 + 587*G1 + 114*B1) / 1000 
#
# Brightness difference is: 
# Absolute difference in brighness indices 
#
# Hue difference is: 
# |R1 - R2| + |G1 - G2| + |B1 - B2|
# where |x| is the absolute value of x
#
# If Brightness difference is more than 125 and the Hue difference is more than 500 then the colors have sufficient contrast
#
# Find out if the given color combos have sufficient contrast and get all the tests passing.
class Color
  attr_reader :r, :g, :b
  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
  end

  def brightness_index
    (299*@r + 587*@g + 114*@b) / 1000
  end

  def brightness_difference(another_color)
    (self.brightness_index - another_color.brightness_index).abs
  end

  def hue_difference(another_color)
    (@r - another_color.r).abs + (@g - another_color.g).abs + (@b - another_color.b).abs
  end

  def enough_contrast?(another_color)
    brightness_difference(another_color) > 125 && hue_difference(another_color) > 500
  end
end

# Problem Statement
# You are given some code in the form of lambdas. 
# Measure and return the time taken to execute that code. 
# You may use Time.now to get the current time.
def exec_time(proc)
  start_time = Time.now
  proc.call
  Time.now - start_time
end

# Problem Statement
# Given a 3 or 4 digit number with distinct digits, return a sorted array of all the unique numbers than can be formed with those digits.
#
# Example: 
# Given: 123 
# Return: [123, 132, 213, 231, 312, 321]
#
# method chaaaaaaaaaiiiiiiiiiin
def number_shuffle(number)
  number.to_s.chars.map { |c| c.to_i }.
    
  permutation.to_a.map { |set| set.join }.
    
  map { |str| str.to_i }.sort
  #number.to_s.chars.to_a.permutation.map(&:join).map(&:to_i)
end

# Problem Statement
# A restaurant has incoming orders for which you need to compute the costs 
# based on the menu.
#
# You might get multiple orders at times.
#
# Examples:
# if the order is {:rice => 1, :noodles => 1}, and the menu is {:rice => 3, 
# :noodles => 2}, then the cost is 5.
#
# If the orders are {:rice => 1, :noodles => 1} and {:rice => 2, :noodles => 2} 
# and the menu is {:rice => 3, :noodles => 2}, then the cost is 15.
class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
=begin    
    total_cost = 0
    orders.each do |order|
      order.each_key do |item|
        total_cost += order[item] * @menu[item]
      end
    end
    total_cost
=end
    total = 0
    orders.each do |order|       
      order.each do |key,number|      
        total += @menu[key] * number 
      end      
    end
    total
  end
end

# Problem Statement
# Given a custom class MyArray, 
# write a 'sum' method that takes a block parameter.
#
# Example: 
# my_array = MyArray.new([1, 2, 3]) 
# my_array.sum gives 6 
# my_array.sum(10) gives 16 
# my_array.sum(0) {|n| n ** 2 } gives 14
class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end
=begin
  def sum(initial_value = 0)
    total = initial_value
    @array.each do |n|
      if block_given?
        total += yield(n)
      else
        total += n
      end
    end
    total
  end
=end
  def sum(initial_value = 0, &block)     
    @array.each do |n|
      if block.nil?
        initial_value += n
      else
        initial_value += block.call(n)      
      end 
    end 
    initial_value
  end
end