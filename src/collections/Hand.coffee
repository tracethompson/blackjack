class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

      

  hit: ->
    @add(@deck.pop())


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


  scoreCheck: (playerScore, dealerScore) ->
    if playerScore > 21
      alert 'You busted!'

    else if dealerScore > 21
      alert 'Dealer busted. You won!'

    else if dealerScore > playerScore && dealerScore < 21 
      alert 'Dealer Won!'

    else if dealerScore is 21 || playerScore is 21
      alert '$$$ Blackjack $$$'
    

  stand: (hit, score, playerScore)->
    if score < playerScore
      $('.stand-button').trigger('click')





    

    
  


