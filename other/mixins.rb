#!/usr/bin/env ruby

module Words
  attr :words
  def to_string( ligature ) 
    return @words.join(ligature)
  end
end

class Paragraph
  include Words
  
  def initialize(words)
    @words = words
  end
  
  def to_string()
    return "\n"+@words.join(" ")+"\n"
  end
end

sentence = Paragraph.new("these are the words".split(/\s+/))
puts sentence.to_string()
