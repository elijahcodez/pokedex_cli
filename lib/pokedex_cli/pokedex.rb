class Pokedex

    @@all = []

    attr_accessor :name, :url, :description

#    def initialize(entry_number, pokemon_species, name)
#        @entry_number = entry_number
#        @pokemon_species = pokemon_species
#        @name = name

#        save
#    end

    def initialize(hash)
        hash.each do |k, v|
            self.send(("#{k}="), v) if self.respond_to?(("#{k}="))
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.select do |pokemon|
            pokemon.name == name
        end
    end

end
