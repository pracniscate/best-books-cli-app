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
      # save this url as an instance variable to later interpolate it into each book's summary address in scrape_summary method
      @url = new_book.url
    end
  end

  def self.scrape_summary(book_id)
    # fix 404 Not Found (OpenURI::HTTPError)
    # begin
    #   summary_page = Nokogiri::HTML(open("https://www.bookdepository.com/bestbooksever#{@url}"))
    # rescue OpenURI::HTTPError
    #   # bypass error
    # end
    summary_page = Nokogiri::HTML(open("https://www.bookdepository.com/One-Hundred-Years-Solitude-Gabriel-Garcia-Marquez/9780141184999"))
    book_summaries = {}
    binding.pry
    book_summaries[:summary] = summary_page.css("div.item-excerpt.trunc").text.gsub(/\n/, "").gsub("  ", "").split("show more")

    book_summaries
  end
end
