class API 
    #responsible for making a call to the api
    #getting the data necessary
    #creating new ruby objects with that data (object oriented)

    def self.get_data
        response = RestClient.get('https://api.thecatapi.com/v1/breeds')
            #gets response from the endpoint
        cats_array = JSON.parse(response)    
        cats_array.each do |cat|
            Cat.new(cat)
        end
        # binding.pry 
    end
end