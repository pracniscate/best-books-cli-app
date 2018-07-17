class BestBooks::CLI

  def call
    BestBooks::Scraper.scrape_books
    welcome
    get_user_input
    menu
  end

  def show_individual_book(book_id)
    summary = BestBooks::Scraper.scrape_summary(book_id)
    puts summary
  end

  def welcome
    puts "Welcome to Best Books! Here you can find your next favorite book to read from a list compiled by the editors at bookdepository.com and then, upon your selection, you can read a short summary of that book."
  end

  def get_user_input
    prompt = "> "
    print prompt

    user_input = nil
    until ["yes", "no"].include? user_input do
      puts "Ready to find your best book? (yes/no)"
      user_input = gets.strip.downcase
    end
    if user_input == "yes"
      show_list
    elsif user_input == "no"
      puts "I'm sorry. Reading is GOOD for you. Showing you the list anyway."
      sleep 2.5
      show_list
    end
  end

  def show_list
    puts "Best Novels of All Time by Our Editors:"
    BestBooks::Books.all.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title} by #{book.author} - #{book.price}"
    end
  end

  def menu
    prompt = "> "
    print prompt

    input = nil
    while(input != "exit")
      puts "Enter the number of the book you'd like to read the description of or type 'exit':"
      input = gets.strip.downcase
        if input.to_i.between?(1, BestBooks::Books.all.size) # check if there is such a book
          show_individual_book(input)
        elsif input == "exit"
          puts "See you soon!"
        else
          puts "This is confusing. Try again."
      end
    end
  end
end
