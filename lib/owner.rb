# require_relative "cat.rb"
require 'pry'
class Owner
  # code goes here
  # An owner should be able to buy and sell a pet, 
  # which will change the pet's mood.

  # When an owner buys a new pet, 
  # the buy_cat/buy_dog methods take in an argument of a name. 
  # You must take that name and do the following:

  # Make a new instance of the appropriate pet, 
  # initializing it with that name and the owner who is purchasing it.

  # An owner should have the ability to walk all their dogs 
  # or feed all their cats, 
  # which will change the mood of all of their pets of that type to "happy".
  # attr_accessor
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 

  def self.count
    @@all.size
  end 

  def self.reset_all
    @@all = []
  end 

  def cats
    Cat.all.select do |cat|
        cat.owner == self # obj ==  obj
    end
  end 

  def dogs
    Dog.all.select do |dog|
      dog.owner == self 
    end 
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    Dog.all.map do |dog| #Dog.all is array of dog objects
      dog.mood = "happy"
    end 
    # binding.pry
  end 

  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end 
  end 

  def sell_pets
    # self.dogs
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end 
    # self.cats
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end 
  end 

  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end 

end