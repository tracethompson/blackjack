class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="new-game">New game!</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    

  '

  events:
    'click .hit-button': -> 
      @model.get('playerHand').hit()
      @model.get('playerHand').scoreCheck(
        @model.get('playerHand').minScore(),
        @model.get('dealerHand').minScore()
        )
    'click .stand-button': -> 
      @model.get('playerHand').stand(@model.get('dealerHand').hit(), 
        @model.get('dealerHand').minScore(), 
        @model.get('playerHand').minScore(),
        @model.get('dealerHand').models[0]
      )
      @model.get('playerHand').scoreCheck(
        @model.get('playerHand').minScore(),
        @model.get('dealerHand').minScore()
        )
    'click .new-game': -> @model.newGame();

  initialize: ->
    @model.on 'newGame', => @render()
    @render()
    
  

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

