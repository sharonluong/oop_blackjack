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


module Decidable

	def hit_or_stay(choice)
		"#{name} chose to #{choice}."
	end

end

module Calculatable

	def calculate_total(hand)
	end
end

class Player
	include Decidable

	attr_accessor :name

	def initialize(name)
		@name = name
	end

end

class Dealer
	attr_accessor

	def initialize

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
		player_cards << Deck.pop
		dealer_cards << Deck.pop
		player_cards << Deck.pop
		dealer_cards << Deck.pop

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
d.deal
c = d.deal

puts c.to_s





