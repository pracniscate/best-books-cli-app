class BestBooks::Books
  attr_accessor :title, :author, :price, :url, :summary, :list

  @@all = []

  def initialize
    @@all << self
  end

  def self.include_summaries(summary_hash)
    # mass assign attributes
    summary_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end

  # separate two different lists and keep track of them
  def self.editors
    @@all.each {|book| book.list == "editors"}
  end

  def self.readers
    @@all.each {|book| book.list == "readers"}
  end

end
