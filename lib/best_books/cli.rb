class BestBooks::CLI

  def call
    welcome
    editors_or_readers
    menu
    goodbye
  end

  def welcome
    puts "Welcome to Best Books! Here you can look at two different lists of the best books of all time: one created by the editors on Book Depository, and the other one created by readers like you. Hope you find a good read!"
  end

  def editors_or_readers
    input = nil
    puts "Which list would you like to access? Type 'editors' or 'readers'."
    input = gets.strip.downcase
    case input 
    when "editors"
      books_by_editors
    when "readers"
      books_by_readers
    else 
      puts "Didn't get that! Please choose between 'editors' or 'readers', and you will be presented with a book list."
    end
  end

  def books_by_editors
    puts "Best Novels Selected by Editors:"
    puts <<-DOC.gsub /^\s*/, ''
      1. One Hundred Years of Solitude by Gabriel Garcia Marquez - $10.04
      2. Tender is the Night by F.Scott Fitzgerald - $16.54
    DOC
  end 

  def books_by_readers
    puts "Best Books Selected by Readers:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Parade's End by Ford Madox Ford - $13.68
      2. The Princess Bride by William Goldman - $7.82
    DOC
  end

  def menu 
    input = nil
    while input != "exit"
      puts "Enter the number of the book you'd like to read the description of or type 'list' to choose the list again or type 'exit':"
      input = gets.strip.downcase
      case input 
      when "1"
        puts "Description of book 1..."
      when "2"
        puts "Description of book 2..."
      when "list"
        editors_or_readers
      else
        puts "This is confusing. Type 'list' or 'exit' or enter the number of the book you'd like to preview:"
      end
    end
  end

  def goodbye 
    puts "See you soon! Enjoy reading your book."
  end
end
