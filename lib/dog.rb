class Dog
  # code goes here
require_relative 'owner.rb'
@@all = []

attr_accessor :mood, :owner
attr_reader :name

def initialize(name, o)
  @name = name
  @owner = o
  @@all << self
  @mood = "nervous"
end

def self.all
  @@all
end











end