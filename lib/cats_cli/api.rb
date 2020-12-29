class API

    def self.get_data
        response = RestClient.get('https://api.thecatapi.com/v1/breeds')
        cats_array = JSON.parse(response)
        cats_array.each do |cat|
            Cat.new(cat)
        end
        # binding.pry 
    end
end