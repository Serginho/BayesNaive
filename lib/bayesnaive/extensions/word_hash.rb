#!/bin/env ruby
# encoding: utf-8

# Author::    Sergio Cancelo (mailto: yo@sergiocancelo.es)
# Copyright:: Copyright (c) 2014 Sergio Cancelo

require "set"
require "lingua/stemmer"

# These are extensions to the String class to provide convenience
# methods for the Classifier package.
class String

  # Removes common punctuation symbols, returning a new string.
  # E.x.,
  #   "Hello (greeting's), with {braces} < >...?".without_punctuation
  #   => "Hello  greetings   with  braces         "
  def without_punctuation
    tr( ',¿?.¡!;:"@#$%^&*()_=+[]{}\|<>/`~', " " ) .tr( "'\-", "")
  end

  # Return a Hash of strings => ints. Each word in the string is stemmed,
  # interned, and indexes to its frequency in the document.
  def word_hash
    word_hash = clean_word_hash()
    symbol_hash = word_hash_for_symbols(gsub(/[\wáéíóúüñ]/," ").split)
    return word_hash.merge(symbol_hash)
  end

  # Return a word hash without extra punctuation or short symbols, just stemmed words
  def clean_word_hash
    word_hash_for_words gsub(/[^\w\sáéíóúüñ]/,"").split
  end

  private

  def word_hash_for_words(words)
    d = Hash.new(0)
    stemmer = Lingua::Stemmer.new(:language => 'es', :encoding => 'utf-8')
    words.each do |word|
      word.downcase!
      if ! CORPUS_SKIP_WORDS.include?(word) && word.length > 2
        d[stemmer.stem(word).intern] += 1
      end
    end
    return d
  end


  def word_hash_for_symbols(words)
    d = Hash.new(0)
    words.each do |word|
      d[word.intern] += 1
    end
    return d
  end

  CORPUS_SKIP_WORDS = Set.new([
        "a",
        "ante",
        "bajo",
        "cabe",
        "con",
        "contra",
        "de",
        "desde",
        "hacia",
        "hasta",
        "para",
        "por",
        "según",
        "sin",
        "so",
        "sobre",
        "tras",
        "me",
        "te",
        "se",
        "nos",
        "os",
        "del",
        "al",
        "la",
        "le",
        "lo",
        "las",
        "les",
        "los",
        "yo",
        "tu",
        "el",
        "ella",
        "nosotros",
        "nosotras",
        "vosotros",
        "vosotras",
        "ellos",
        "ellas",
        "ustedes",
        "e",
        "i",
        "o",
        "u",
        "mi",
        "vos",
        "mío",
        "mía",
        "míos",
        "mías",
        "tuya",
        "tuyo",
        "tuyas",
        "tuyos",
        "suya",
        "suyo",
        "suyas",
        "suyos",
        "nuestra",
        "nuestro",
        "nuestras",
        "nuestros",
        "vuestra",
        "vuestro",
        "vuestras",
        "vuestros",
        "este",
        "esta",
        "estos",
        "estas",
        "aquel",
        "aquella",
        "aquellos",
        "aquellas",
        "uno",
        "una",
        "unos",
        "unas",
        "alguno",
        "alguna",
        "algunos",
        "algunas",
        "ningún",
        "ninguno",
        "ninguna",
        "ningunos",
        "ningunas",
        "escaso",
        "escasos",
        "escasa",
        "escasas",
        "bastante",
        "mucho",
        "mucha",
        "muchos",
        "muchas",
        "demasiado",
        "demasiada",
        "demasiados",
        "demasiadas",
        "todo",
        "toda",
        "todos",
        "todas",
        "otro",
        "otra",
        "otros",
        "otras",
        "mismo",
        "misma",
        "mismos",
        "mismas",
        "tan",
        "tanto",
        "tanta",
        "tantos",
        "tantas",
        "alguien",
        "nadie",
        "cualquiera",
        "quienquiera",
        "demás",
        "cualesquiera",
        "quenesquiera",
        "demás",
        "poco",
        "pocas",
        "ese",
        "esa",
        "esos",
        "esas",
        "si",
        "sí",
        "no",
        "antes",
        "después",
        "usted",
        "y",
        "ni",
        "pero",
        "sino",
        "luego",
        "conque",
        "tan",
        "excepto",
        "salvo",
        "más",
        "menos",
        "mas",
        "que",
        "qué",
        "quien",
        "quién",
        "cómo",
        "cuándo",
        "cuando",
        "porque",
        "again",
        "all",
        "along",
        "are",
        "also",
        "an",
        "and",
        "as",
        "at",
        "but",
        "by",
        "came",
        "can",
        "cant",
        "couldnt",
        "did",
        "didn",
        "didnt",
        "do",
        "doesnt",
        "dont",
        "ever",
        "first",
        "from",
        "have",
        "her",
        "here",
        "him",
        "how",
        "i",
        "if",
        "in",
        "into",
        "is",
        "isnt",
        "it",
        "itll",
        "just",
        "last",
        "least",
        "like",
        "most",
        "my",
        "new",
        "no",
        "not",
        "now",
        "of",
        "on",
        "or",
        "should",
        "sinc",
        "so",
        "some",
        "th",
        "than",
        "this",
        "that",
        "the",
        "their",
        "then",
        "those",
        "to",
        "told",
        "too",
        "true",
        "try",
        "until",
        "url",
        "us",
        "were",
        "when",
        "whether",
        "while",
        "with",
        "within",
        "yes",
        "you",
        "youll"
              ])
end
