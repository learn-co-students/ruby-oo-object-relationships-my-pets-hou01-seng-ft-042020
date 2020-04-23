require_relative 'owner'


class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    
    @@all << self

  end

  def self.all
    @@all
  end

  def self.find_cat(name)
    Cat.all.select{|cat| cat.name == name}
  end
  


end