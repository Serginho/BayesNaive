#!/bin/env ruby
# encoding: utf-8

# Author::    Sergio Cancelo (mailto: yo@sergiocancelo.es)
# Copyright:: Copyright (c) 2014 Sergio Cancelo

require File.dirname(__FILE__) + '/../test_helper'
class BayesianTest < Test::Unit::TestCase
  def setup
    @classifier_spanish = Classifier::Bayes.new 'Bonito', 'Feo'
  end

  def test_good_training
    assert_nothing_raised { @classifier_spanish.train_bonito "amor"}
  end

  def test_bad_training
    assert_raise(StandardError) { @classifier_spanish.train_no_category "palabras" }
  end

  def test_bad_method
    assert_raise(NoMethodError) { @classifier_spanish.forget_everything_you_know "" }
  end

  def test_categories
    assert_equal ['Bonito', 'Feo'].sort, @classifier_spanish.categories.sort
  end

  def test_add_category
    @classifier_spanish.add_category 'Indiferente'
    assert_equal ['Indiferente', 'Bonito', 'Feo'].sort, @classifier_spanish.categories.sort
  end

  def test_classification
    @classifier_spanish.train_bonito "Yo creo que esta frase es marabillosamente bonita y todo es marabilloso"
    @classifier_spanish.train_feo "No me gusta esta sección pero la verdad es que nada de esto me interesa"
    assert_equal 'Bonito', @classifier_spanish.classify("Esta sección es marabillosa")
  end
end