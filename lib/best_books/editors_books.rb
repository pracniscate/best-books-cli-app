class BestBooks::EditorsBooks
  attr_accessor :title, :author, :price, :url

  def self.name
    # scrape Book Depository and then return books based on that data
    self.scrape_books
  end

  def self.scrape_books
    books = []
    # go to the website, find the book
    # extract the properties
    # instantiate a book

    books
  end

end
