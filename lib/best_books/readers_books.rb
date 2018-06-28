class BestBooks::ReadersBooks
  attr_accessor :title, :author, :price, :url

  def self.name
    # scrape Book Depository and then return books based on that data
    book_1 = self.new
    book_1.title = "Parade's End"
    book_1.author = "Ford Madox Ford"
    book_1.price = "$13.68"
    book_1.url = "https://www.bookdepository.com/Parades-End-Ford-Madox-Ford/9781849904933"

    book_2 = self.new
    book_2.title = "The Princess Bride"
    book_2.author = "William Goldman"
    book_2.price = "$7.82"
    book_2.url = "https://www.bookdepository.com/Princess-Bride-William-Goldman/9780747590583"

    [book_1, book_2]
  end

end
