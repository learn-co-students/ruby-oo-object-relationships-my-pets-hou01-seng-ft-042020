require "pry"

class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name, species="human")
    @name=name 
    @species=species
    @@all << self 
  end

  # def species(human)
  #   @species=human  
  # end 

  def say_species
     "I am a human."
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
    Cat.all.select do |x| x.owner == self end 
  end 

  def dogs
    Dog.all.select do |x| x.owner == self end 
  end 

  def buy_cat(name)
    name=Cat.new(name, self, mood="happy")
  end 

  def buy_dog(name)
    name=Dog.new(name, self, mood="happy")
  end 

  def walk_dogs
    dogs.each do |x| x.mood = "happy" end 
  end 

  def  feed_cats
    cats.each do |x| x.mood = "happy" end
    end 

  def sell_pets
    dogs.each do |x| x.mood = "nervous" end 
    cats.each do |x| x.mood = "nervous" end
    dogs.each do |x| x.owner = nil end 
    cats.each do |x| x.owner = nil end 
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end