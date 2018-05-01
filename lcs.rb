# Longest common sequence.
#
# Given two stings, A="FHTUYDMDOF" and B="HSUGTEKSHJ" what is the longest
# common sequence of *non sequential* letters. 2, "HU"...
# 
# Note how we use a hash to prevent ourselves recursing down the same path
# twice. So we know we've already been on this road, we can stop.#

a = "ABOCPKLNQJU12"
b = "XAIBCLMVTQW13"

def seek(l, r)
  recurse(l.split(''), r.split(''), [], {})
end

def recurse(l, r, sequence, skip)
  puts "#{l.join} #{r.join}"

  if r.empty? || l.empty?
    return sequence
  end

  # This is a HUGE efficiency saving... but does create loads of extra data.
  if skip.key?(l.join) && skip[l.join].key?(r.join)
    return sequence
  end

  skip[l.join][r.join] = 1 if skip.key?(l.join)
  skip[l.join] = { r.join => 1 } unless skip.key?(l.join)

  if l.last == r.last
    sequence.unshift(l.last)
    return recurse(l[0..-2],r[0..-2], sequence, skip)
  else
    # Ruby's particular approach to pass-by-value means we have to modify the sequence...
    lseq = recurse(l.slice(0..-2), r, Array.new(sequence), skip)
    rseq = recurse(l, r.slice(0..-2), Array.new(sequence), skip)
    return ( lseq.length > rseq.length ? lseq : rseq)
  end
end

puts "\n\n Answer:" + Array(seek(a, b)).join


