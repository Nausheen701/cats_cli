

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

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_cat(cat_name)
        self.all.find do |cat|
            cat.name == cat_name
        end
    end
end