class BestBooks::CLI

  def call
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Best Novels:"
    puts <<-DOC.gsub /^\s*/, ''
    # change this
    1. One Hundred Years of Solitude by Gabriel Garcia Marquez - $10.04
    2. Tender is the Night by F.Scott Fitzgerald - $16.54
    DOC
  end

  def menu 
    input = nil
    while input != "exit"
      puts "Enter the number of the book you'd like to read the description of or type 'list' to see the books again or type 'exit':"
      input = gets.strip.downcase
      case input 
      when "1"
        puts "Description of book 1..."
      when "2"
        puts "Description of book 2..."
      when "list"
        list_books
      else
        puts "This is confusing. Type 'list' or 'exit' or enter the number of the book you'd like to preview:"
      end
    end
  end

  def goodbye 
    puts "See you soon! Enjoy reading your book."
  end
end
