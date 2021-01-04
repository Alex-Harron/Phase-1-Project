class CLI
    
    def intro
        puts "Hello Traveler, welcome to Star Tours! Can we interest you in a ride on one of our top-of-the-line space crusiers?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Please enter your name to get started:"
        greeting(user_input)
    end

    def user_input
        gets.strip
    end

    def greeting(name)
        countdown(1)
        puts "Welcome aboard #{name}, would you like view the systems our space cruisers travel to?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter 'yes' to see the list of systems or 'exit' to terminate this interaction!"
        response
    end

    def planets_list 
        ["Tattooine", "Hoth", "Earth"].each.with_index(1) do |planet, i|
            puts "~~~~~~~~~~~~~~~"
            puts "#{i}. #{planet}"
        end
        planet_choice
    end

    def countdown(number)
        while number > 0 
            puts "Loading..."
            number -= 1
            sleep (1.5)
        end
    end

    def goodbye
        countdown(1)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Goodbye, I hope you come back and travel with us soon! Thanks for choosing Star Tours!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def invalid
        countdown(1)
        puts "My software cannot handle that response. Please try again."
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter 'yes' to see the list of systems or 'exit' to terminate this interaction!"
        response
    end

    def planet_choice
        puts "Select a system to view more information about that destination."

        selection = user_input
        Planet.find_planet(selection)
    end

    def response
        selection = user_input
        if selection == 'yes'
            countdown(3)
            planets_list
            response
        elsif selection == 'exit'
            goodbye
        else 
             invalid
        end
    end
end 