require'pry'

class Owner
  attr_reader :species, :name

  @@all = []

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
    # binding.pry
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
      # binding.pry
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
    # binding.pry
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
      # binding.pry
    end
  end

  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end

