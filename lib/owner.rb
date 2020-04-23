require 'pry'
require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
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
    name = Cat.new(name, self)
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    # Dog.all.select do |dog|
    #   if dog.owner == self
    #     dog.mood = 'happy'
    #   end
    # end
    dogs.map do |dog| 
      dog.mood = 'happy'
    end
  end

  def feed_cats
    cats.map do |cat| 
      cat.mood = 'happy'
    end
  end

  def sell_pets
    cats.map do |cat| 
      cat.mood = 'nervous'
      cat.owner = nil
    end

    dogs.map do |dog| 
      dog.mood = 'nervous'
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end


# esther = Owner.new('Esther')
# james = Owner.new('James')

# kitty = Cat.new('Kitt','Esther')
# puppy = Dog.new('Puppy', 'James')

# binding.pry
# 0
