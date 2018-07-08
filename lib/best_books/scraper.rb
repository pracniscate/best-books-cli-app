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
      new_book.url = book.css("a").attr("href").value
      new_book.author = book.css(".author").text.gsub(/\n/, "").gsub("  ", "")
      # remove the span element attached to the price
      remove_span = book.css("div.price-wrap .price")
      remove_span.children.select { |c| c.remove if c.name == "span" }
      new_book.price = book.css("div.price-wrap .price").text.gsub(/\n/, "").gsub("  ", "")
    end
  end

  def self.scrape_summary(book_url)
    # renaming the book url variable for more convenient access
    new_book.url = book_url
    summary_page = Nokogiri::HTML(open(book_url))
    book_summaries = {}

    book_summaries[:summary] = summary_page.css(".item-excerpt trunc").text

    book_summaries
  end
end
