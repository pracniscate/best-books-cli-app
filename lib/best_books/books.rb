class BestBooks::Books
  # prevent scraping for the same summary more than once
  attr_accessor  :author, :title, :price, :url
  attr_writer :summary

  @@all = []

  def initialize
    @@all << self
  end

  def summary(input)
    @summary ||= BestBooks::Scraper.scrape_summary(input)
  end

  def self.all
    @@all
  end

end
