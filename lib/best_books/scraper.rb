class BestBooks::Scraper
  attr_accessor :doc

  def initialize(url = "https://www.bookdepository.com/bestbooksever")
    # include customers' list: https://www.bookdepository.com/yourbestbooksever
    @doc = Nokogiri::HTML(open(url))

    # binding.pry
  end

  def scrape_books
    # make sure the text does not include whitespace
    doc.css("div.item-info").each do |book|
      book = BestBooks::Books.new

      title = book.css(".title").text,
      author = book.css(".author").text,
      price = book.css("div.price-wrap .price").text

      book.save
    end
  end
end
