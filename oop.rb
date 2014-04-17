class Card
	attr_accessor :suit, :value

	def initialize(s, v)
		@suit = s
		@value = v
	end

	def to_s
		"This is your card: #{value} of #{suit}."
	end

end

class Deck
	attr_accessor :cards

	def initialize
		@cards = []
		['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
			['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
				@cards << Card.new(suit, face_value)
			end
		end	
		shuffle_cards
	end

	def shuffle_cards
		cards.shuffle!
		
	end

	def deal
		cards.pop
	end	


end


module Hand

	def total
		values = cards.map{|e| e.value}

		total = 0
		values.each do |a|
			if a == 'A'
				total += 11
			elsif a.to_i == 0
				total += 10
			else
				total += a.to_i
			end
		end

		values.select{|e| e == 'A'}.count.times do
			if total > 21
				total -=10
			end
		end

		total
	end

	def show_hand
		puts "---#{name}'s Hand---"
		cards.each do |card|
			puts "#{card}"
		end
		puts "#{name}'s Total = #{total}."
	end

	def add_card(new_card)
		cards << new_card
	end

	def is_busted?
		total > 21
	end
end

class Player
	include Hand

	attr_accessor :name, :cards

	def initialize(name)
		@name = name
		@cards = []
	end

	def hit_or_stay(choice)
		"#{name} chose to #{choice}."
	end

end

class Dealer
	include Hand

	attr_accessor :name, :cards

	def initialize
		@name = "Dealer"
		@cards = []
	end

end



class Blackjack
	attr_accessor :player, :dealer, :deck, :player_cards, :dealer_cards

	def initialize
		puts "What's your name?"
		player_name = gets.chomp
		@player = Player.new(player_name)
		@dealer = Dealer.new
		@deck = Deck.new
		@player_cards = []
		@dealer_cards = []
		puts "Hello, #{@player.name}!"
	end

	def deal_cards(person)
		person.add_card(deck.deal)
	end

	def show_flow
		player.show_hand
		dealer.show_hand
	end

	def player_turn
		if player.total == 21
			puts "Congratulations, #{player.name}!"
			exit
		end

		while player.total < 21
			puts "Would you like to hit or stay?"
			choice = gets.chomp
			if !['hit', 'stay'].include?(choice)
				puts "Error: enter hit or stay."
				
			end
			if choice == "stay"
				puts "You chose to stay. Your total is #{player.total}"
				break
			else
				deal_cards(player)
				show_flow
			end
		end

		if player.total > 21
			puts "#{player.name} busted!"
			exit
		end
	end

	def dealer_turn
		if dealer.total == 21
			puts "Dealer got blackjack! #{player.name} loses."
			exit
		end

		while dealer.total <= 17
			deal_cards(dealer)
			show_flow
		end

	end

	def who_won?
		if dealer.total > 21
			puts "Dealer busted. #{player.name} wins!"
		elsif  player.total == 21 
			puts "#{player.name} got blackjack!"
		elsif dealer.total < player.total
			puts "#{player.name} won!"
		elsif dealer.total == 21
			puts "Dealer got blackjack. #{player_name} loses."
		elsif dealer.total > player.total
			puts "Dealer Won!"
		else 
			puts "It's a tie. Here is your bet back."
		end
	end

	def run
		deal_cards(player)
		deal_cards(dealer)
		deal_cards(player)
		deal_cards(dealer)
		show_flow
		player_turn
		show_flow
		dealer_turn
		who_won?
	end

	
end

game = Blackjack.new.run






