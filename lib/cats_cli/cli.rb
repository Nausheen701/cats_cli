#communicates between user and data

class CLI

    def start
        
        puts "Welcome to Kittikoy! Let's get you started on the path to adopting a cat."
        puts "Please enter your name:"
        API.get_data
        
        #binding.pry
    
        greet(user_input)
       
    end 

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Great, nice to meet you #{name}! Would you like to learn more about our kitties?"
        puts "Input 'y' to see the list or 'exit' to leave Kittikoy."
        menu
    end

    def cats_list
        Cat.all.each.with_index(1) do |cat, i| 
            puts "#{i}. #{cat.name}"
        end
        cat_selection
    end

    def goodbye
        puts "Bye for now! Visit us again when you want to continue your kitti search!"
    end

    def invalid
        puts "That's not a valid option. Let's try again."
        menu
    end

    def cat_selection
        puts "Select a cat to find out our more!"

        selection = user_input
        cat = Cat.find_cat(selection)
        cat_details(cat)
    end

    def cat_details(cat)
        puts "Name: #{cat.name}"
        puts "Temperament: #{cat.temperament}"
        puts "Origin: #{cat.origin}"
        puts "Description: #{cat.description}"
        #menu
    end

    def menu
        selection = user_input
        if selection == 'y'
            cats_list
            menu
        elsif selection == 'exit'
            goodbye
        else 
            invalid
        end 
    end
end