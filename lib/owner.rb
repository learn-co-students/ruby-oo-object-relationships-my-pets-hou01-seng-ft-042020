class Owner
  # code goes here

  # getting macro method
  attr_reader :name, :species

  # empty array that we will push all owners into
  @@owners = []

  # intializes with name and species, and pushes owner instance into array
  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
  end

  # method to print its species
  def say_species
    "I am a #{@species}."
  end

  # returns all instances of owner that has been created
  def self.all
    @@owners
  end

  # returns the number of owners that have been created
  def self.count
    @@owners.count
  end

  # resets the owners that have been created
  def self.reset_all
    self.all.clear
  end

  # returns a collection of all cats that belong to the owner
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  # returns a collection of all dogs that belong to the owner
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  # creates new instance of cat with self as owner
  def buy_cat(cat)
    Cat.new(cat, self)
  end

  # creates new instance of dog with self as owner
  def buy_dog(dog)
    Dog.new(dog, self)
  end

  # makes each dog the owner owns moods happy
  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  # makes each cat the owner has moods happy
  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  # makes every pet nervous
  def sell_pets
    [dogs, cats].map do |pets|
      pets.map do |pet| 
        pet.mood = "nervous"
        pet.owner = nil
      end
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end