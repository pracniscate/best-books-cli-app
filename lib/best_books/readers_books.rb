class BestBooks::ReadersBooks

  def self.title
    puts <<-DOC.gsub /^\s*/, ''
      1. Parade's End by Ford Madox Ford - $13.68
      2. The Princess Bride by William Goldman - $7.82
    DOC
  end

end
