require_relative 'item'
require_relative 'book'
require_relative 'label'
require_relative 'book_methods'
require_relative '../src/store/preserve_book_label'
require_relative 'music_albums_handler'
require_relative 'genre_handler'
require_relative '../src/store/write'

class App
  include BookMethods
  include PreserveBookLabel
  include GenreHandler
  include MusicAlbumHandler

  def initialize
    @items = []
    @genres = []
    @labels = []
    @authors = []
    load_from_file
  end

  def exit_app
    puts 'Thank you for using this app!'
    Write.new.store(@items, @genres)
    exit
  end

  def option_select(option)
    case option
    when 1
      list_books
    when 2
      list_all_music_albums(@items)
    when 3
      list_games
    when 4
      list_genres(@genres)
    when 5
      list_labels
    when 6
      list_authors
    end
  end

  def add_element(_input)
    puts [
      'Select an option',
      '1. Add a book',
      '2. Add a music album',
      '3. Add a game'
    ]
    user_input = gets.chomp.to_i
    case user_input
    when 1
      add_book
    when 2
      add_music_album_to(@items, @genres)
    when 3
      add_game
    end
  end

  def run
    puts [
      '1. List all books',
      '2. List all music albums',
      '3. List all games',
      '4. List all genres',
      '5. List all labels',
      '6. List all authors',
      '7. Add Item',
      '8. Exit'
    ]

    puts "Welcome, please select an option by entering the corresponding number: \n\n"
    input = gets.chomp.to_i

    exit_app if input == 8
    add_element(input) if input == 7
    puts 'Invalid option, try again.' if input > 8

    option_select(input)
    puts "\nPress Enter key to continue..."
    gets
    run
  end
end
