require 'pry'

require_relative 'cat.rb'
require_relative 'dog.rb'


class Owner
  # code goes here
  attr_reader :name, :species
  
  @@all = []
  

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self

  end

# Owner information 
  
  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.uniq.count
  end

  def self.reset_all
    self.all.clear
  end

  # Owner cats & dogs 

  def cats
    Cat.all.select{|cats| cats.owner == self}
  end
  
  def dogs
    Dog.all.select{|dogs| dogs.owner == self}
  end

# Buy pets 

  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end

  # Walk and Feed Pets 

  def walk_dogs
    self.dogs.each do |dogs|
      dogs.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cats|
      cats.mood = "happy"
    end
  end

  # Sell the pets v.v 

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  
  end

  # List of all the owners pets 

  def list_pets
    # allpets = []
    # allpets << self.dogs
    # allpets << self.cats
    # allpets.flatten

    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  
  end


end