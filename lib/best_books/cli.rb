class BestBooks::CLI

  def call
    puts "Best Novels:"
    list_books
  end

  def list_books
    puts <<-DOC.gsub /^\s*/, ''
    # change this
    1. One Hundred Years of Solitude by Gabriel Garcia Marquez - $10.04
    2. Tender is the Night by F.Scott Fitzgerald - $16.54
    DOC
  end

end
