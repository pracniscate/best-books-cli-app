class BestBooks::EditorsBooks
  attr_accessor :title, :author, :price, :url

  def self.name
    # return a bunch of instances of titles
    puts <<-DOC.gsub /^\s*/, ''
      1. One Hundred Years of Solitude by Gabriel Garcia Marquez - $10.04
      2. Tender is the Night by F.Scott Fitzgerald - $16.54
    DOC
    book_1 = self.new
    book_1.title = "One Hundred Years of Solitude"
    book_1.author = "Gabriel Garcia Marquez"
    book_1.price = "$10.04"
    book_1.url = "https://www.bookdepository.com/One-Hundred-Years-Solitude-Gabriel-Garcia-Marquez/9780141184999"

    book_2 = self.new
    book_2.title = "Tender is the Night"
    book_2.author = "F.Scott Fitzgerald"
    book_2.price = "$16.54"
    book_2.url = "https://www.bookdepository.com/Tender-is-Night-F-Scott-Fitzgerald/9780141194066"

    [book_1, book_2]
  end

end
