class Planet

    @@all = []

    attr_accessor :name, :climate, :terrain, :population

    def initialize (planet_hash)
        planet_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
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
