class API

      def self.get_data

          response = RestClient.get("https://pokeapi.co/api/v2/pokedex/2/")
          pokemon_array = JSON.parse(response.body)["pokemon_entries"]

          pokemon_array.each do |pokemon|
              Pokedex.new(pokemon["pokemon_species"])
          end
          self.get_details

      end
      def self.get_details
          Pokedex.all.each do |pokemon|
            response = RestClient.get(pokemon.url)
            pokemon_array = JSON.parse(response.body)
            pokemon.description = pokemon_array["flavor_text_entries"].first["flavor_text"]
          end

      end
end
