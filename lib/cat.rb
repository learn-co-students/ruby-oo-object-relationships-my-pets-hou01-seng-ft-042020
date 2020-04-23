class Cat
  # code goes here
  require_relative 'owner.rb'
  @@all = []
  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(n,owner)
    @name = n
    @owner = owner
    @mood = "nervous"
    @@all << self

  end

  def self.all
    @@all
  end










end