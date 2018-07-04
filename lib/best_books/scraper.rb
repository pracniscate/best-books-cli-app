class BestBooks::Scraper
  attr_accessor :doc

  def initialize(url = "https://www.bookdepository.com/bestbooksever")
    # include customers' list: https://www.bookdepository.com/yourbestbooksever
    @doc = Nokogiri::HTML(open(url))

    binding.pry
  end

  def scrape_books
    doc.css("div.item-info").each do |book|
      title = book.css(".title").text,
      author = book.css(".author").text,
      price = book.css("div.price-wrap"[0]).text

    BestBooks.create(title: title, author: author, price: price)
    end
  end
end

Scraper.new.initialize
