class PokedexCli::CLI

  def call

      puts "Welcome Trainer!"
      puts "Loading..."
      API.get_data
      pokedex_menu

  end

  def pokedex_menu
      puts "To use your Pokedex, enter 'open'"
      puts "To exit your Pokedex, enter 'exit'"

      input = gets.strip.downcase

      if input == "open"
          pokemon_menu
      elsif input == "exit"
          goodbye
      else
          invalid_entry
          pokemon_menu
      end

  end

  def pokemon_menu

      puts "To view Pokemon, enter 'view'"
      puts "To exit your Pokedex, enter 'exit'"

      input = gets.strip.downcase

      if input == "view"
          pokemon_list
          description_menu

      elsif input == "exit"
          goodbye
      else
          invalid_entry
          menu
      end
  end

  def description_menu

    puts ""
    puts "For a Pokemon description, enter their Pokedex number."

      input = gets.strip.to_i

      if input > 151 || input < 1
        invalid_entry
        description_menu
      else
        pokemon_description(input)
        looping_menu
      end
  end

  def looping_menu

        puts ""
        puts "Do you want to view another Pokemon's description?"
        puts ""
        puts "If yes, enter 'yes'. If no, enter 'exit'"

        input = gets.strip.downcase

        if input == "yes"
            description_menu

        elsif input == "exit"
            goodbye
        else
            invalid_entry
            looping_menu
        end

    end

  def pokemon_list

      Pokedex.all.each_with_index do |pokemon, index|
          puts "#{index + 1}. #{pokemon.name}"
      end

      puts ""
      puts "These are all of the original Pokemon from the Kanto region."

  end

  def pokemon_description(input)

      index = input - 1
      pokemon = Pokedex.all[index]
      puts "#{pokemon.name}: #{pokemon.description}"

  end

  def goodbye

      puts "Goodbye, and good luck on your Pokemon journey!"

  end

  def invalid_entry

      puts "Invalid entry, try again."

  end

end
