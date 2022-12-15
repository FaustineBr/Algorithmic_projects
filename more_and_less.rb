MIN_NUMBER = 1

def start_game()
    player_level = ask_player_level()
    max = level_setting(player_level)
    random_number = generate_random_number(max)
    player_number = ask_player_number(max)
    level_setting(player_level)
    check_entry(player_number, max)
    compare_numbers(random_number, player_number)
    restart_game()
end

def ask_player_level()
    print "Choisis le niveau :\n1. Facile\n2. Intermédiaire \n3. Difficile\n\n"
    print "Quel est ton choix ? "
    player_level = http://gets.chomp.to_i
    return player_level
end

def level_setting(player_level)
    if player_level == 1
        max = 100
    elsif player_level == 2
        max = 1000
    else
        max = 10000
    end
    return max
end

def ask_player_number(max)
    print " Choisis un nombre entre #{MIN_NUMBER} et #{max} : "
    player_number = http://gets.chomp.to_i
    return player_number
end

def generate_random_number(max)
    random_number = rand(MIN_NUMBER..max)
    print "The random number is #{random_number}\n"
    return random_number
end

def check_entry(player_number, max)
    if player_number < MIN_NUMBER || player_number > max
        print "Mauvaise saisie, veuillez entrer un nouveau nombre : " ;
        player_number = http://gets.chomp.to_i
    end
end

def compare_numbers(random_number, player_number)
    nb_trials = 1
        until player_number == random_number
        if player_number < random_number
            print "Le nombre saisi est trop petit ! Choisis un nouveau nombre : " ;
            player_number = http://gets.chomp.to_i ;
            nb_trials += 1
        else
            print "Le nombre saisi est trop grand ! Choisis un nouveau nombre : " ;
            player_number = http://gets.chomp.to_i ;
            nb_trials += 1
        end
    end
    print "C'est gagné ! Vous avez trouvé en #{nb_trials} coups.\n"
end

def restart_game()
    print "Rejouer ?\n" ;
    play_again = gets.chomp.downcase
    while play_again == "yes"
        start_game()
        print "Rejouer ?\n" ;
        play_again = gets.chomp.downcase
    end
    print "Au revoir !\n"
end

start_game()