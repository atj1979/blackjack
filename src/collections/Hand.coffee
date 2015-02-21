class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  stand: ->
    @trigger 'stand'
    $('.stand-button').css({'visibility':'hidden'})
    $('.hit-button').css({'visibility':'hidden'})

  hit: ->
    @add(@deck.pop())
    if @scores()[0]>21
      alert('lose')
    #   if lose

    #     trigger 'lose'


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

  autoPlay: ->
    console.log 'autoPlay called'
  #if @isDealer and @stand
    #if @scores()[0]< 21 and @scores()[0]>17
      #see who won
