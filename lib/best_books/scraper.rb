class BestBooks::Scraper
  attr_accessor :doc

  def initialize
  end

  def self.scrape_books
    url = "https://www.bookdepository.com/bestbooksever"
    # include customers' list: https://www.bookdepository.com/yourbestbooksever
    doc = Nokogiri::HTML(open(url))
    # make sure the text does not include whitespace
    doc.css("div.item-info").each do |book|
      new_book = BestBooks::Books.new
      # binding.pry

      new_book.title = book.css(".title").text.gsub(/\n/, "").gsub("  ", "")
      # if new_book.title = index[0]
      new_book.author = book.css(".author").text.gsub(/\n/, "").gsub("  ", "")
      new_book.price = book.css("div.price-wrap .price").text

    end
  end
end
