class API
    def self.get_data
        response = RestClient.get('https://swapi.py4e.com/api/planets/')
        planets_array = JSON.parse(response)["results"]
        planets_array.each do |planet|
            Planet.new(planet)
        end
    end
end
