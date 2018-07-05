class BestBooks::CLI

  def call
    welcome
    editors_or_readers
    menu
  end

  def welcome
    puts "Welcome to Best Books! Here you can look at two different lists of the best books of all time: one created by the editors on Book Depository, and the other one created by readers like you. Hope you find a good read!"
  end

  def editors_or_readers
    # ? implement input 'list' to be able to switch to another list w/o typing it expicitly
    input = nil
    puts "Which list would you like to access? Type 'editors' or 'readers'."
    input = gets.strip.downcase

    case input
    when "editors"
      show_list("editors")
    when "readers"
      show_list("readers")
    else
      puts "Didn't get that! Please choose between 'editors' or 'readers'."
    end
  end

  def show_list(list)
    # make sure this returns a list
    # wrong number of arguments (given 0, expected 1) (ArgumentError)
    if list == "editors"
      puts "Best Novels of All Time by Our Editors:"
      BestBooks::Books.editors.each do |book|
        puts "#{book.title} by #{book.author} - #{book.price}"
      end
    elsif list == "readers"
      puts "Top-choice Books by Our Customers:"
      BestBooks::Books.readers.each do |book|
        puts "#{book.title} by #{book.author} - #{book.price}"
      end
    end
  end

  # def new_books
  #   # scrape books from the website
  #   # undefined method `scrape_books' for BestBooks::Scraper:Class (NoMethodError)
  #   books = BestBooks::Scraper.scrape_books
  #   # then, create an array of books
  #   BestBooks::Books.create_from_collection(book_array)
  # end

  # give books attributes

  # def menu
  #   BestBooks::Books.display_menu()
  # end

  def menu
    input = nil

    while(input != "exit")
      puts "Enter the number of the book you'd like to read the description of or type 'list' to choose the list again or type 'exit':"
      input = gets.strip.downcase

      case input
      when input.to_i > 0
        # show the description of the chosen book.
        # scrape the description
      when "list"
        # ? implement input 'list' to be able to switch to another list w/o typing it expicitly
        editors_or_readers
      when "exit"
        puts "See you soon!"
      else
        puts "This is confusing. Try again."
      end
    end
  end
end
