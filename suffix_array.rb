# Sample of Suffix Arrays in ruby from https://gist.github.com/yagihiro/302245
# Modified to use standard array bsearch with `log(n)`...
# Bsearch tips: https://hashrocket.com/blog/posts/binary-searching-and-ruby-s-bsearch-method

class SuffixArray

  attr_accessor :word           # original string(String)
  attr_accessor :sary           # suffix array(Array)

  def initialize(word)
    @word = word
    @sary = Array.new(@word.size) {|i| i }
    puts @sary.join(', ')
    @sary.sort! {|i, j|  @word[i..-1] <=> @word[j..-1] }
    puts @sary.join(', ')
  end

  def search(key)
    i = @sary.bsearch do |x| 
      puts "🔎 #{x} -> #{key} <=> #{@word[x, key.size]} == #{key <=> @word[x, key.size]}"
      key <=> @word[x, key.size]
    end
    puts i
    return @word[i, key.size] unless i.nil?
    '💩'
  end
end

sary = SuffixArray.new 'Binary search considers three situations when looking for an element: the element is found, the element resides in the high part of the array, or the element resides in the low part of the array.'
puts sary.search('t of t')

