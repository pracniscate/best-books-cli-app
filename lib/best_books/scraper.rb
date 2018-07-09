class BestBooks::Scraper

  BASE_URL = "https://www.bookdepository.com"
  EDITORS_URL = "#{BASE_URL}/bestbooksever"
  READERS_URL = "#{BASE_URL}/yourbestbooksever"

  def self.scrape_books
    doc = Nokogiri::HTML(open(BASE_URL))
    # if user typed in 'editors', go to EDITORS_URL
    # if user typed in 'readers', go to READERS_URL
    doc.css("div.item-info").each do |book|
      new_book = BestBooks::Books.new

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
    binding.pry
    book_url = self.scrape_books.new_book.url
    book_summaries = {}

    book_summaries[:summary] = summary_page.css(".item-excerpt trunc").text

    book_summaries
  end
end
