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

	def calculate_total
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
		puts "#{name}'s Hand"
		cards.each do |card|
			puts "#{card}"
		end
		puts "#{name}'s Total = #{calculate_total}."
	end

	def add_card(new_card)
		cards << new_card
	end

	def is_busted?
		calculate_total > 21
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
		@player = Player.new('Sharon')
		@dealer = Dealer.new
		@deck = Deck.new
		@player_cards = []
		@dealer_cards = []
		puts "Hello, #{@player}!"
	end

	def deal_cards

	end

	def run
		deal_cards
		#show_flow
		#player_turn
		#dealer_turn
		# who_won?
	end

	
end

game = Blackjack.new
d = Deck.new
p = Player.new("Sharon")
dlr = Dealer.new

p.add_card(d.deal)
p.add_card(d.deal)
p.show_hand

dlr.add_card(d.deal)
dlr.add_card(d.deal)
dlr.show_hand





