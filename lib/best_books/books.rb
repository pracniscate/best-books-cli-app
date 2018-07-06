class BestBooks::Books
  attr_accessor :title, :author, :price, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.create_from_collection(book_array)
    book_array.each {|book| self.new(book)}
    book_array.save
    book_array
  end

  def attributes(attribute_hash)
    # mass assign attributes
    attribute_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end

  # separate two different lists and keep track of them
  def self.editors
    @@all.select {|book| book.list == "editors"}
  end

  def self.readers
    @@all.select {|book| book.list == "readers"}
  end

  # def display_menu
  #   puts "displaying menu"
  # end

end
