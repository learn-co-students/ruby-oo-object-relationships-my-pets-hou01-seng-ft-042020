require_relative "cat.rb"
require_relative "dog.rb"
require 'pry'

class Owner
  # code goes here


  attr_reader :name, :species
  attr_writer
  attr_accessor 

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
      @@all.count
    end

    def self.reset_all
      self.all.clear
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

    def buy_cat(cat_name)
      # binding.pry
      new_cat = Cat.new(cat_name, self)
      # binding.pry
    end

    def buy_dog(dog_name)
      new_dog = Dog.new(dog_name, self)
    end

    def walk_dogs
      #mood = happy
      Dog.all.select do |dog|
        dog.mood = "happy"
      end
    end

    def feed_cats
      #mood = happy
      Cat.all.select do |cat|
        cat.mood = "happy"
      end
    end

    def sell_pets
      #makes all pets nervous
      #makes all pets without an owner
      Dog.all.each do |dog|
        # binding.pry
        dog.mood = "nervous"
        dog.owner = nil
      end
      Cat.all.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    def list_pets
      return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end
    


end