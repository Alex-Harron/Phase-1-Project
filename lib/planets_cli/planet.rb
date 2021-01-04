class Planet

    @@all = []

    attr_accessor :name, :climate, :terrain, :population

    def initialize (name, climate, terrain, population)
        @name = name
        @climate = climate
        @terrain = terrain
        @population = population
        save
    end

    def save
        @@all << self
    end

    def self.all 
        @@all 
    end
    
    def self.find_planet(planet_name)
        self.all.find do |planet|
            planet.name == planet_name
        end
    end
end
