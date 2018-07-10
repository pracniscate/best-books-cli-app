class BestBooks::Books
  attr_accessor :title, :author, :price, :url, :summary, :list

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
