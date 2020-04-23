require 'pry'
class Cat
  # code goes here
  # macro getter
  attr_reader :name
  # macro getter & setter
  attr_accessor :owner, :mood

  # binding.pry

  # empty array that will store all cats
  @@cats = []

  # Initializes with name and owner, sets mood to nervous, and pushes all cat instances created into cats array
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@cats << self
  end

  # returns all instances of cat that have been created
  def self.all
    @@cats
  end
end