class Scraper
  attr_accessor :doc

  def initialize(url = "https://google.com")
    @doc = open(url)
  end

  def scrape_books
    doc.css("#book").each do |book|
      title = book.css("#title")

      BestBooks.create(title: title, etc: etc)
    end
  end
end 
