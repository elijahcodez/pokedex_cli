class PokedexCli::CLI

  def call

      puts "Welcome Trainer!"
      puts "To use your Pokedex, enter 'open'"
      puts "To exit your Pokedex, enter 'exit'"
      API.get_data
      menu

  end

  def menu

      input = gets.strip.downcase

      if input == "open"
          menu_2
      elsif input == "exit"
          goodbye
      else
          invalid_entry
          menu
      end

  end

  def menu_2

      puts "To view Pokemon, enter 'view'"
      puts "To exit your Pokedex, enter 'exit'"

      input = gets.strip.downcase

      if input == "view"
          pokemon_list
          menu

      elsif input == "exit"
          goodbye
      else
          invalid_entry
          menu
      end
  end

  def pokemon_list

      Pokedex.all.each_with_index do |pokemon, index|
          puts "#{index + 1}. #{pokemon.pokemon_species}"
      end

      puts ""
      puts ""
      puts "These are all of the original Pokemon from the Kanto region."
      puts ""
      puts ""
      puts "When you are finished, enter 'exit'"


  end

  def goodbye

      puts "Goodbye, and good luck on your Pokemon journey!"

  end

  def invalid_entry

      puts "Invalid entry, try again."

  end

end
