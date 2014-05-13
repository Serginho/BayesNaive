# Author::    Lucas Carlson  (mailto:lucas@rufy.com)
# Copyright:: Copyright (c) 2005 Lucas Carlson

require 'bayesnaive/extensions/word_hash'

class Object
  def prepare_category_name; to_s.gsub("_"," ").capitalize.intern end
end