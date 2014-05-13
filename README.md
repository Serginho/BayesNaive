# Bayesnaive

An implementation of Bayes Naïve algorithm to classify documents that are written in spanish language.

## Installation

Add this line to your application's Gemfile:

    gem 'bayesnaive'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bayesnaive

## Usage

```ruby
require 'bayesnaive'

classifier = Classifier::Bayes.new 'Good', 'Bad'
classifier.train_good "That's good"
classifier.train_bad "That's bad"
category = classifier.classify 'something bad'

puts category
```
