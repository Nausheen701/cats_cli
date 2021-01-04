#communicates between user and data

class CLI

    def start #entryway method to cli, called upon instantiating file
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Welcome to Kittikoy! Let's get you started on the path to adopting a cat."
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Please enter your name:"
        API.get_data
        #hardcode means putting data that we want to output, instead of accessing external data (literal v abstract)
        #binding.pry
        greet(user_input)  
    end 

    def user_input #removes white spaces all the times user inputs info
        gets.strip
    end

    def greet(user_name)
        #anything put into a string is read literally unless it is interpolated, in which case it is evaluated to its actual value
        puts " "
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Great, nice to meet you #{user_name}! Would you like to learn more about our kitties?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Input 'y' to see the list or 'exit' to leave Kittikoy:"
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
        puts " "
        puts "That's not a valid option. Let's try again:"
        menu
    end

    def cat_selection
        puts " "
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Select a cat to find out our more! For example, you can enter: Cyprus"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter the cat name:"
        selection = user_input.capitalize
        cat = Cat.find_cat(selection)
        cat_details(cat)
        cat_finalize
    end

    def cat_details(cat)
        puts " "
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{cat.name}"
        puts "Temperament: #{cat.temperament}"
        puts "Origin: #{cat.origin}"
        puts "Description: #{cat.description}"
    end

    def menu
        selection = user_input
        if selection == 'y'
            cats_list
            menu #recursion is when you call a method within itself
        elsif selection == 'exit'
            goodbye
        else 
            invalid
        end 
    end

    def cat_finalize
        puts " "
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Is this the kitti for you?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Input 'yes' to adopt this cat, 'menu' to see other kitties, or 'exit' to leave Kittikoy:"
         adopt
     end

     def adopt
        finalize = user_input
        if finalize == 'yes'
            puts " "
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Congratulations on choosing a kitti! One of our kitti specialists will help you complete your adoption."
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        elsif finalize == 'exit'
            goodbye
        elsif finalize == 'menu' 
            cats_list
        else 
            invalid
        end 
    end

end