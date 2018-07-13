# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
The BestBooks::CLI class interacts with the user and is responsible for getting the scraping data from BestBooks::Scraper, and it also collaborates with BestBooks::Books class to keep track of the collection of books.

- [x] Pull data from an external source
I used `Nokogiri` and `Open-Uri` to scrape a page from `https://www.bookdepository.com/bestbooksever` which has a list of books, and then, using the url of each item, the app pulls each summary of individual books.

- [x] Implement both list and detail views
The `BestBooks::Scraper` class method `self.scrape_books` is responsible for getting the numbered list with the title, author, and price. The method `self.scrape_summary(book_id)` provides a book's summary, each one of which has their own page.
