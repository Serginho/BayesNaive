#!/bin/env ruby
# encoding: utf-8

# Author::    Sergio Cancelo (mailto: yo@sergiocancelo.es)
# Copyright:: Copyright (c) 2014 Sergio Cancelo

require File.dirname(__FILE__) + '/../test_helper'
class StringExtensionsTest < Test::Unit::TestCase
  def test_word_hash
    hash = {:coch => 1, :madr => 1, :estrop => 1, :ayer => 1, :mañan => 1, :! => 1}
    assert_equal hash, "El coche de mi madre se ha estropeado ayer por la mañana!".word_hash

    hash = {:pas=>1,:tiemp=>1,:octubr=>1,:"2008"=>1,:startup=>1,:suec=>1,:present=>1,:merc=>1,:servici=>1,:","=>1,:-=>1}
    assert_equal hash, "Ha pasado ya bastante tiempo desde que en octubre de 2008, una start-up sueca presentara al mercado un servicio".word_hash
  end


  def test_clean_word_hash
    hash = {:coch => 1, :madr => 1, :estrop => 1, :ayer => 1, :mañan => 1}
    assert_equal hash, "El coche de mi madre se ha estropeado ayer por la mañana!".clean_word_hash

    hash = {:pas=>1,:tiemp=>1,:octubr=>1,:"2008"=>1,:startup=>1,:suec=>1,:present=>1,:merc=>1,:servici=>1}
    assert_equal hash, "Ha pasado ya bastante tiempo desde que en octubre de 2008, una start-up sueca presentara al mercado un servicio".clean_word_hash
  end

end
