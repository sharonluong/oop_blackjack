class Card
	attr_accessor :suit, :value

	def initialize(s, v)
		@suit = s
		@value = v
	end

	def to_s
		"This is your card: #{suit}, #{value}"
	end

end

class Deck
	attr_accessor :cards

	def initialize
		@cards = []
		['Hearts', 'Diamonds', 'Spades', 'Clubs'],each do |suit|
			['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
				@cards << Card.new(suit, face_value)
			end
		end	
		shuffle_cards
	end

	def shuffle_cards
		cards.shuffle	
	end

	def deal
		cards.pop
	end	
end

class Player

end

class Dealer

end

class Blackjack
	attr_accessor :player, :dealer, :deck

	def initialize
		@player = Player.new
		@dealer = Dealer.new
		@deck = Deck.new
	end

	def run
		deal_cards
		show_flow
		player_turn
		dealer_turn
		who_won?
	end
end

Blackjack.new.run
