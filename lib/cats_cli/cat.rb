

class Cat

    @@all = []

    attr_accessor :name, :temperament, :origin, :description

    # def initialize(name, temperament, origin, description)
    #     @name = name
    #     @temperament = temperament
    #     @origin = origin
    #     @description = description
    #     save
    # end

    def initialize(cat_hash)
        cat_hash.each do |k, v|
            self.send("#{k}=",v) if self.respond_to?("#{k}=")
         end
         save
    end

    def save #saves each instance of cat
        @@all << self
    end

    def self.all #reads the all array
        @@all
    end

    def self.find_cat(cat_name) #this class method will accept the user's selected cat name and find the object in the class (it will find details about the selected cat)
        self.all.find do |cat| #find finds the first element that fulfills the condition
            cat.name == cat_name #from the array, find the cat instance that matches the cat name that is passed in to this method
        end
    end

end