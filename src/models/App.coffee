# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', => @dealerTurn() # dealerTurn


    #@set('dealerHand').on('stand')  #somefunction here


    # stupid function heree
    # reveal the dealer card .flip()



    # dealer needs to get as close to 17 -21 as possible
    #   logic here

    # if >21 then player wins!

    # if <21 and > player score, then dealer wins



  dealerTurn: =>
    console.log 2
    return 3
   # @get 'dealerHand', -> autoPlay

