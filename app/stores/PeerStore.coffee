assign = require("object-assign")
EventEmitter = require("events").EventEmitter

AppDispatcher = require("../dispatcher/AppDispatcher")
MainConstants = require("../constants/MainConstants")

CHANGE_EVENT = "change"

ActionTypes = MainConstants.ActionTypes
CHANGE_EVENT = "change"

_peers = []
_myVideo = null

PeerStore = assign {}, EventEmitter::,
  emitChange: ->
    @emit CHANGE_EVENT

  ###*
  @param {function} callback
  ###
  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback

  # get: (id) ->
  #   _messages[id]

  getOtherVideos: ->
    otherVideos = []
    mainVideo = PeerStore.getMainVideo()
    for peer in _peers
      otherVideos.push peer unless peer == mainVideo


    otherVideos.push _myVideo unless _myVideo == mainVideo

    otherVideos

  getMainVideo: ->
    console.log("Running", _myVideo)
    return _myVideo if _peers.length == 0
    # FANCY MAGIC ON WHO'S TALKING....
    _peers[0]

PeerStore.dispatchToken = AppDispatcher.register((payload) ->
  action = payload.action
  switch action.type
    when ActionTypes.LOCAL_WEBCAM_STARTED
      console.log("Setting _myVideo", action.video)
      _myVideo = action.video
      # AppDispatcher.waitFor [PeerStore.dispatchToken]
      PeerStore.emitChange()
    when ActionTypes.NEW_PEER
      console.log("adding Peer", action.video)
      _peers.push action.video
      # AppDispatcher.waitFor [PeerStore.dispatchToken]
      PeerStore.emitChange()
    when ActionTypes.PEER_LEFT
      console.log("removing Peer", action.video)
      index = _peers.indexOf action.video
      _peers.splice index, 1
      # _peers.push action.video
      # AppDispatcher.waitFor [PeerStore.dispatchToken]
      PeerStore.emitChange()
    else
)

# do nothing
module.exports = PeerStore
