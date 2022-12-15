MIN_NUMBER = 1
MAX_NUMBER = 49
ADDITIONAL_MAX_NUMBER = 10

dday = Time.new
print "\nBienvenue au Grand Tirage Loto du #{dday.strftime("%d/%m/%Y")}\n\n"

def start_game()
    random_number = generate_random_number()
    player_number = ask_player_number()
    right_numbers = compare_numbers(player_number,random_number)
    gains = gains(right_numbers)
    results(right_numbers,gains)
    play_more()
end

def generate_random_number()
    random_list_of_numbers = []
    i = 1
    until i == 7
        random_number = rand(MIN_NUMBER..MAX_NUMBER)
        random_list_of_numbers.push(random_number)
        i += 1
    end
    print "(random numbers : #{random_list_of_numbers})\n"
    return random_list_of_numbers
end

def ask_player_number()
    print "\nChoisis 6 nombres entre 1 et 49.\n"
    player_list_of_numbers = []
    choice_number = 1
    until choice_number == 7
        print "\nChoix #{choice_number} : "
        player_number = gets.chomp.to_i
        check_entry(player_number,player_list_of_numbers)
    choice_number += 1
    end
    print "\nTa grille est validée : #{player_list_of_numbers}\n"
    return player_list_of_numbers
end

def check_entry(player_number,player_list_of_numbers)
    number_ok = false
    while number_ok == false
        if player_number < MIN_NUMBER || player_number > MAX_NUMBER
            print "Le numéro choisi n'est pas valide, veuillez rééssayer : " ; player_number = gets.chomp.to_i ;
        elsif
            check_duplicate(player_number,player_list_of_numbers) == true
            print "Vous avez déjà choisi ce numéro, veuillez rééssayer : " ; player_number = gets.chomp.to_i ;
        else
            number_ok = true ;
            player_list_of_numbers.push(player_number)
        end
    end
end

def check_duplicate(player_number,player_list_of_numbers)
    if player_list_of_numbers.include?(player_number)
        return true
    end
    return false
end

def compare_numbers(player_number,random_number)
    print "\nLe tirage va avoir lieu !\n"
    print "\nVoici les résultats : #{random_number}\n"
    right_numbers = 0
    player_number.each { |n|
    if random_number.include?(n)
        right_numbers += 1
    end
    }
    return right_numbers
end

def gains(right_numbers)
    if right_numbers <= 2
        gains = 0
    elsif right_numbers == 3
        gains = 30
    elsif right_numbers > 3 && right_numbers <= 5
        gains = 1000
    else
        gains = 1000000
    end
    return gains
end

def results(right_numbers,gains)
    print "\nTu as trouvé #{right_numbers} bon(s) numéro(s), ton gain est de #{gains} €."
end

def play_more()
    print "\n\nSouhaites-tu participer à un tirage supplémentaire ?\n" ; play_again = gets.chomp.downcase
    if play_again == "oui"
        additional_game()
    else
        print "Au revoir !\n"
    end
end

def additional_game()
    additional_random_number = rand(MIN_NUMBER..ADDITIONAL_MAX_NUMBER)
    print "\n(random number : #{additional_random_number})\n"
    print "\nChoisis un nombre entre #{MIN_NUMBER} et #{ADDITIONAL_MAX_NUMBER} : \n" ; additional_player_number = gets.chomp.to_i
    if additional_player_number == additional_random_number
        print "C'est gagné, tu gagnes 10 € !"
    else
        print "Perdu ! Au revoir"
    end
end

start_game()