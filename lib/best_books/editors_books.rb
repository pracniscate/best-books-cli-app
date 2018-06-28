class BestBooks::EditorsBooks

  def self.title
    # return a bunch of instances of titles
    puts <<-DOC.gsub /^\s*/, ''
      1. One Hundred Years of Solitude by Gabriel Garcia Marquez - $10.04
      2. Tender is the Night by F.Scott Fitzgerald - $16.54
    DOC
  end

end
