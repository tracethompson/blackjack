class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  #Lost method: This event should re render the app view (basically everything)
  # @.on 'loss' ->
  	