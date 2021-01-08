class CLI
    def intro
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Hello Traveler, welcome to STAR TOURS! Can we interest you in a premium trip on one of our top-of-the-line Starships?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Please enter your name to get started:"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        API.get_data
        greeting(user_input)
    end
    def user_input
        gets.strip
    end
    def greeting(name)
        countdown(1)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Welcome aboard #{name}, would you like to view the systems our Starships travel to?"
        puts "(Enter 'yes' to see the list of systems or 'exit' to terminate this interaction!)"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        response
    end
    def planets_list 
        Planet.all.each.with_index(1) do |planet, i|
            puts "~~~~~~~~~~~~~~~~~~~~"
            puts "#{i}. #{planet.name}"
        end
        planet_choice
    end
    def countdown(number)
        while number > 0 
            puts "Loading..."
            number -= 1
            sleep (1.2)
        end
    end
    def print_countdown(number)
        while number > 0
            puts "Printing..."
            number -= 1
            sleep (1.2)
        end
    end
    def goodbye
        countdown(1)
        puts "                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "                Goodbye, we hope you come back and travel with us soon! Thanks for choosing STAR TOURS!"
        puts "                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end
    def invalid
        countdown(1)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "!!That is not a valid response. Please try again!!"
        puts "(Enter 'yes' to see the list of systems or 'exit' to terminate this interaction.)"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        response
    end
    def confirm 
        countdown(1)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Is this where you would like to travel?"
        puts "(Enter 'yes' to confirm selection and print your ticket or 'return' to return to the system selection.)"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def purchase 
        print_countdown(3)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Thank you for choosing STAR TOURS! Please retrieve your ticket from the machine. Have great day and a wonderful trip!"
        puts "                  (Enter 'yes' to buy another ticket or 'exit' to terminate this interaction.)                       "
        puts "                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                       "
        response
    end 
    def error 
        countdown(1)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "!!That is not a valid response. Please try again!!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        planet_response
    end
    def planet_choice
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter a system's name to view more information about that destination."
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        selection = user_input
        planet = Planet.find_planet(selection)
        if selction = planet
        countdown(2)
        destination_details(planet)
        else
        invalid
        end
    end
    def destination_details(planet)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{planet.name}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Climate: #{planet.climate}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Terrain: #{planet.terrain}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Population: #{planet.population}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        planet_response
    end
    def response
        selection = user_input
        if selection == 'yes'
            countdown(3)
            planets_list
        elsif selection == 'exit'
            goodbye
        else 
             invalid
        end
    end
    def planet_response
        confirm
        selection = user_input
        if selection == 'return'
            countdown(3)
            planets_list
        elsif selection == 'yes'
            purchase
        else 
        error
        end
    end
end 