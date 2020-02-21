namespace :import do
  desc 'Import authors'
  task authors: :environment do
    CSV.foreach('data/authors.csv', headers: true, col_sep: ';') do |row|
      author = row.to_hash
      Author
        .find_or_create_by(email: author['email'])
        .update(firstName: author['firstName'], lastName: author['lastName'])
    end
  end

  desc 'Import magazines'
  task magazines: :environment do
    CSV.foreach('data/magazines.csv', headers: true, col_sep: ';', converters: :date) do |row|
      magazine = row.to_hash
      authors = magazine['authors'].split(',').map { |email| Author.find_or_create_by(email: email) }
      Magazine
        .find_or_create_by(isbn: magazine['isbn'])
        .update(authors: authors, title: magazine['title'], publishedAt: magazine['publishedAt'])
    end
  end

  desc 'Import books'
  task books: :environment do
    CSV.foreach('data/books.csv', headers: true, col_sep: ';') do |row|
      book = row.to_hash
      authors = book['authors'].split(',').map { |email| Author.find_or_create_by(email: email) }
      Book
        .find_or_create_by(isbn: book['isbn'])
        .update(authors: authors, title: book['title'], description: book['description'])
    end
  end
end
