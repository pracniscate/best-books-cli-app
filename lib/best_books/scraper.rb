class BestBooks::Scraper

  def self.scrape_books
    doc = Nokogiri::HTML(open("https://www.bookdepository.com/bestbooksever"))
    doc.css("div.item-info").each do |book|
      new_book = BestBooks::Books.new

      new_book.title = book.css(".title").text.gsub(/\n/, "").gsub("  ", "")
      new_book.author = book.css(".author").text.gsub(/\n/, "").gsub("  ", "")
      # remove the span element attached to the price
      remove_span = book.css("div.price-wrap .price")
      remove_span.children.select { |c| c.remove if c.name == "span" }
      new_book.price = book.css("div.price-wrap .price").text.gsub(/\n/, "").gsub("  ", "")
      new_book.url = book.css("a").attr("href").value
    end
  end

  def self.scrape_summary(book_id)
    url = BestBooks::Books.all[book_id.to_i - 1].url # specific book url
    puts "Loading the summary of book ##{book_id} for you..."
    summary_page = Nokogiri::HTML(open("https://www.bookdepository.com#{url}"))

    summary_list = {}
    summary_list[:summary]  = summary_page.css("div.item-excerpt.trunc").text.gsub(/\n/, "").gsub("  ", "").split("show more")
  end
end
