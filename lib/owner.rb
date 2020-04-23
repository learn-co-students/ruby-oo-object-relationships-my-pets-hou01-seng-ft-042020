require_relative "cat.rb"
require_relative "dog.rb"

class Owner
  attr_reader :name, :species, :say_species
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a #{@species}."
    @@all << self
    @@count += 1

  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name,self)
    
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Cat.all.select do |cat|
      cat.mood = "nervous"
    end
    Cat.all.select do |cat|
      cat.owner = nil
    end
    
    Dog.all.select do |dog|
      dog.owner = nil
    end
    Dog.all.select do |dog|
      dog.mood = "nervous"
    end
  end

  def list_pets
    p "I have #{self.cats.length} dog(s), and #{self.dogs.length} cat(s)."

  end
end