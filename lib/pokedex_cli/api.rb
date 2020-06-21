class API

      def self.get_data

          response = RestClient.get("https://pokeapi.co/api/v2/pokedex/2/")
          pokemon_array = JSON.parse(response.body)["pokemon_entries"]

          pokemon_array.each do |pokemon|
              Pokedex.new(pokemon)
          end

      end

end
