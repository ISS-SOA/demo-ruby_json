books = {}
books['books'] = []
books['books'].push('title' => 'The Unbearable Lightness of Being', 'author' => 'Milan Kundera')
books['books'].push('title' => 'Seven Pillars of Wisdom', 'author' => 'T. E. Lawrence')

puts books.json
# {"books"=>[{"title"=>"The Unbearable Lightness of Being", "author"=>"Milan Kundera"}, {"title"=>"Seven Pillars of Wisdom", "author"=>"T. E. Lawrence"}]}

mybooks = {}
mybooks['The Unbearable Lightness of Being'] = 'Milan Kundera'
mybooks['Seven Pillars of Wisdom'] = 'T. E. Lawrence'

puts books.to_json
# {"The Unbearable Lightness of Being":"Milan Kundera","Seven Pillars of Wisdom":"T. E. Lawrence"}

require 'json'

##
# Represent books as native Ruby objects but provide descriptive to_json
class Books
  def []=(title, author)
    @books ||= {}
    @books[title] = author
  end

  def to_json
    @books.map do |title, author|
      { 'title' => title, 'author' => author }
    end.to_json
  end
end

mybooks = Books.new
mybooks['The Unbearable Lightness of Being'] = 'Milan Kundera'
mybooks['Seven Pillars of Wisdom'] = 'Milan Kundera'

puts mybooks.to_json
