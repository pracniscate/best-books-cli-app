class BestBooks::Books
  attr_accessor :title, :author, :price, :url

  def self.best
    # scrape both lists on Book Depository and then return deals based on that data
    input = gets.strip.downcase
    if input == "editors"
      self.scrape_editors
    elsif input == "readers"
      self.scrape_readers
    end
  end

  def self.scrape_editors
    editors_books = []

    # go to https://www.bookdepository.com/bestbooksever
    # extract the properties
    # instantiate a book

    editors_books

    # book_1 = self.new
    # book_1.title = "One Hundred Years of Solitude"
    # book_1.author = "Gabriel Garcia Marquez"
    # book_1.price = "$10.04"
    # book_1.url = "https://www.bookdepository.com/One-Hundred-Years-Solitude-Gabriel-Garcia-Marquez/9780141184999"
    #
    # book_2 = self.new
    # book_2.title = "Tender is the Night"
    # book_2.author = "F.Scott Fitzgerald"
    # book_2.price = "$16.54"
    # book_2.url = "https://www.bookdepository.com/Tender-is-Night-F-Scott-Fitzgerald/9780141194066"
    #
    # [book_1, book_2]
  end

  def self.scrape_readers
    readers_books = []

    # go to https://www.bookdepository.com/yourbestbooksever
    # extract the properties
    # instantiate a book

    readers_books

    # book_1 = self.new
    # book_1.title = "Parade's End"
    # book_1.author = "Ford Madox Ford"
    # book_1.price = "$13.68"
    # book_1.url = "https://www.bookdepository.com/Parades-End-Ford-Madox-Ford/9781849904933"
    #
    # book_2 = self.new
    # book_2.title = "The Princess Bride"
    # book_2.author = "William Goldman"
    # book_2.price = "$7.82"
    # book_2.url = "https://www.bookdepository.com/Princess-Bride-William-Goldman/9780747590583"
    #
    # [book_1, book_2]
  end


end
