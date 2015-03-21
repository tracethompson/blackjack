# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    # @.on 'lost', console.log 'listening'
    @set 'deck', deck = new Deck() 
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
  	# console.log 'listening'
 

 #trigger newGame function
  newGame: ->
    debugger
    @set 'deck', deck = new Deck() 
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @trigger('newGame')
