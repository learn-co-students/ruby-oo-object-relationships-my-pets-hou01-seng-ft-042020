class Dog
  # code goes here
  
  # getter and setter macro
  attr_accessor :owner, :mood
  # getter macro
  attr_reader :name

  # empty array that will contain all dog instances created
  @@dogs = []

  # intializes with a name and a owner, sets mood to nervous, and pushes all dog instances into dogs array
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@dogs << self
  end

  # returns all instances of dog that have been created
  def self.all
    @@dogs
  end
end