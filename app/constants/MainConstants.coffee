keyMirror = require('keymirror')

module.exports =
  ActionTypes: keyMirror
    SET_IDENTITY: null
    CALL: null
    INCOMING_CALL: null
    CALL_ANSWERED: null
    CALL_ANSWER: null
    CALL_REJECTED: null
    CALL_REJECT: null
    INCOMING_CALL_REJECTED: null
    ALL_IDENTITIES: null
    CALL_HANGUP: null
    CALL_CANCELED: null
    INVITE: null
    OUTGOING_CALL: null
    JOIN_ROOM: null
    NEW_PEER: null
    PEER_LEFT: null
    MUTE_AUDIO: null
    UNMUTE_AUDIO: null
    MUTE_VIDEO: null
    UNMUTE_VIDEO: null
    LOCAL_WEBCAM_STARTED: null
    LOCAL_WEBCAM_REMOVED: null
    LOCAL_SCREEN_SHARE_STARTED: null
    LOCAL_SCREEN_SHARE_REMOVED: null
    STOP_SCREEN_SHARE: null
    START_SCREEN_SHARE: null
    SELECT_VIDEO: null
    CREATE_MESSAGE: null
    NEW_MESSAGE: null
    INSTALL_EXTENSION: null
  PayloadSources: keyMirror
    CINE_ACTION: null
    SERVER_ACTION: null
    VIEW_ACTION: null
