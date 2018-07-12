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
    puts "Welcome to Best Books! Here you can look at two different lists of the best books of all time: one created by the editors on Book Depository, and the other one created by readers like you. Hope you find a good read!"
  end

  def get_user_input
    prompt = "> "
    print prompt

    user_input = nil
    until ["yes", "no"].include? user_input do
      puts "Would you like to see some books?"
      user_input = gets.strip.downcase
    end
    if user_input == "yes"
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
      puts "Enter the number of the book you'd like to read the description of or type 'list' to choose the list again or type 'exit':"
      input = gets.strip.downcase
        if input.to_i > 0
          show_individual_book(input)
        elsif input == "exit"
          puts "See you soon!"
        else
          puts "This is confusing. Try again."
      end
    end
  end
end
