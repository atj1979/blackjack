# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', => @dealerTurn() # dealerTurn
    @get('dealerHand').on 'checkWin', => @checkWin()
    @get('playerHand').on 'checkWin', => @checkWin()

    #@set('dealerHand').on('stand')  #somefunction here


    # stupid function heree
    # reveal the dealer card .flip()



    # dealer needs to get as close to 17 -21 as possible
    #   logic here

    # if >21 then player wins!

    # if <21 and > player score, then dealer wins



  dealerTurn: =>
   # console.log @get('dealerHand')
   @get('dealerHand').trigger('autoPlay')


  checkWin: =>
    dealer = @get('dealerHand').scores()[0]
    player = @get('playerHand').scores()[0]
    if  dealer > 21
      @confirmBox('The House loses')
    else if player >21 and dealer<17
      @confirmBox('You lose')
    else if (dealer >= 17)
        if player > dealer
            @confirmBox('You win')
        else
            @confirmBox('The House Wins')




  confirmBox: (text) =>
    newAlert = confirm text
    if newAlert
      console.log "reload"
      location.reload();



