# Author::    Sergio Cancelo (mailto: yo@sergiocancelo.es)
# Copyright:: Copyright (c) 2014 Sergio Cancelo

require 'bayesnaive/extensions/word_hash'

class Object
  def prepare_category_name; to_s.gsub("_"," ").capitalize.intern end
end