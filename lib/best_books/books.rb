class BestBooks::Books
  attr_accessor :title, :author, :price, :url

  @@all = []
  @@all_editors = []
  @@all_readers = []

  def initialize(obj)
    @title = title
    @author = author
    @price = price
    @url = url

    if self.list == "editors"
      @@all_editors << self
    elsif self.list == "readers"
      @@all_readers << self
    end
    @@all << self
  end

  def self.create_from_collection(book_array)
    book_array.each {|book| self.new(book)}
  end

  def attributes(attribute_hash)
    # mass assign attributes
    attribute_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end

  def self.all_editors
    @@all_editors
  end

  def self.all_readers
    @@all_readers
  end

  def display_menu
  end

end
