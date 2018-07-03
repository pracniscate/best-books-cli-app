class BestBooks::Books
  attr_accessor :title, :author, :price, :url

  @@all = []
  @@all_editors = []
  @@all_readers = []

  def initialize(obj)
    @title = title
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
