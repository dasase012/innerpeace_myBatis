<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>innerpeace video consultation</title>
  <meta charset="utf-8">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .local-video {
      width: 165px;
      height: 165px;
    }
    .remote-video {
      width: 320px;
      height: 240px;
    }
    @media (min-width: 992px) {
      .remote-video {
        width: 640px;
        height: 480px;
      }
    }
    .chat-timeline {
      height: 200px;
      font-size: 9px;
      overflow: auto;
    }
    .chat-timeline .local {
      color: blue;
    }
    .chat-timeline .remote {
      color: red;
    }
    @media (min-width: 992px) {
      .channel-list {
        font-size: 0.8em;
      }
    }
  </style>
</head>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

	<!-- video consultation -->

		  <div class="container" style="margin-top: 70px;">
    <div class="row">

      <div class="col-md-6 col-md-offset-3 hide">
        <div class="alert alert-info alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          ...
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-2">

       <!--  <h2 class="h3">Profile/Config</h2> -->
       <div>
       
            
       <!-- <h3 class="h4">User Id</h3> -->
        <form>
          <div class="form-group" style="margin-top: 70px;">
            <label class="sr-only" for="userId">Enter your user id.</label>
            <input class="form-control" type="text" id="userId" placeholder="user ID: ${id }" value="">
          </div>
        </form>  
		</div>
		
        <h2 class="h3">Room No.</h2>
        <form>
          <div class="from-gruop">
            <input class="form-control" type="text" id="createChannelId" placeholder="Create and connect the channel." value="" readonly="">
            <label class="sr-only" for="createChannelId">Channel Id</label>
          </div>
          <button class="btn btn-default btn-sm btn-block" id="createChannel">
            <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> Create
          </button>
        </form>
        <button class="btn btn-default btn-sm btn-block" id="disconnectChannel">
          <span class="glyphicon glyphicon-stop" aria-hidden="true"></span> Disconnect
        </button>

        <h3 class="h4">Channel List</h3>
        <div class="list-group channel-list" id="channelList"></div>

        <button class="btn btn-default btn-sm pull-right" id="refreshChannel">
          <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> Refresh
        </button>
      </div>

      <div class="col-md-7">
        <h2 class="h3">Psychiatrist</h2>
        <div class="well">
          <video class="remote-video center-block" id="remoteVideo"></video>

          <div class="text-center hide">
            <button class="btn btn-default btn-sm" id="saveFileFromRemote">
              <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Save
            </button>
          </div>

          <div class="text-center">
<!--             <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>
 -->            <div class="btn-group" role="group" aria-label="...">
              <button class="btn btn-default btn-sm" id="startRemoteVideoRecord">
                <span class="glyphicon glyphicon-record" aria-hidden="true"></span> Record
              </button>
              <button class="btn btn-default btn-sm" id="stopRemoteVideoRecord">
                <span class="glyphicon glyphicon-stop" aria-hidden="true"></span> Stop
              </button>
              <button class="btn btn-default btn-sm" id="saveRemoteVideoRecord">
                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Save
              </button>
            </div>
          </div> 
        </div>

      </div>
      <div class="col-md-3">
        <h2 class="h3">${id}</h2>
        <div class="well">
          <video class="local-video center-block" id="localVideo" muted></video>

          <div class="progress" id="sendFileToRemoteBarWrapper">
            <div class="progress-bar" id="sendFileToRemoteBar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0px;">
              <span class="sr-only">60% Complete</span>
            </div>
          </div>

         <div class="text-center">
<!--             <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>
 -->            <div class="btn-group" role="group" aria-label="...">
              <button class="btn btn-default btn-sm" id="startLocalVideoRecord">
                <span class="glyphicon glyphicon-record" aria-hidden="true"></span> Record
              </button>
              <button class="btn btn-default btn-sm" id="stopLocalVideoRecord">
                <span class="glyphicon glyphicon-stop" aria-hidden="true"></span> Stop
              </button>
              <button class="btn btn-default btn-sm" id="saveLocalVideoRecord">
                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Save
              </button>
            </div>
          </div>

        </div>

        <div class="well chat-timeline" id="timeline" style="overflow: auto;">
        </div>

        <form>
          <label class="sr-only" for="sendMessage">Transfer Message</label>
          <div class="input-group input-group-sm">
            <div class="input-group-addon">
              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            </div>
            <input type="text" class="form-control" id="sendMessage" placeholder="Enter your message.">
            <span class="input-group-btn">
              <button class="btn btn-default" id="sendText">
                <span class="glyphicon glyphicon-send" aria-hidden="true"></span> Send
              </button>
            </span>
          </div>
        </form>

<!--       <form class="form-inline">
          <div class="row">
            <div class="col-md-8">
              <label class="sr-only" for="selectFile">Choose File</label>
              <input type="file" id="selectFile">
            </div>
            <div class="col-md-4">
              <button class="btn btn-default btn-xs pull-right" id="sendFile">
                <span class="glyphicon glyphicon-send" aria-hidden="true"></span> Send
              </button>
            </div>
          </div>
        </form>
 -->
      </div>
    </div>
  </div>

  <script src="//www.playrtc.com/sdk/js/playrtc.js"></script>
  <script>
    'use strict';
    var createChannelButton = document.querySelector('#createChannel');
    var createChannelIdInput = document.querySelector('#createChannelId');
    var refreshChannelButton = document.querySelector('#refreshChannel');
    var channelList = document.querySelector('#channelList');
    var getChannelList;
    var disconnectChannelButton = document.querySelector('#disconnectChannel');
    var startRemoteVideoRecordButton = document.querySelector('#startRemoteVideoRecord');
    var stopRemoteVideoRecordButton = document.querySelector('#stopRemoteVideoRecord');
    var saveRemoteVideoRecordButton = document.querySelector('#saveRemoteVideoRecord');
    var startLocalVideoRecordButton = document.querySelector('#startLocalVideoRecord');
    var stopLocalVideoRecordButton = document.querySelector('#stopLocalVideoRecord');
    var saveLocalVideoRecordButton = document.querySelector('#saveLocalVideoRecord');
    var chattingTimeline = document.querySelector('#timeline');
    var sendMessageInput = document.querySelector('#sendMessage');
    var selectFileInput = document.querySelector('#selectFile');
    var sendTextButton = document.querySelector('#sendText');
    var sendFileButton = document.querySelector('#sendFile');
    var sendFileToRemoteBar = document.querySelector('#sendFileToRemoteBar');
    var sendFileToRemoteBarWrapper = document.querySelector('#sendFileToRemoteBarWrapper');
    var remoteVideo = document.querySelector('#remoteVideo');
    var localVideo = document.querySelector('#localVideo');
    var recordedRemoteVideoBlob;
    var recordedRemoteVoiceBlob;
    var recordedLocalVideoBlob;
    var recordedLocalVoiceBlob;
    var userIdInput = document.querySelector('#userId');
    var userId;
    var app;
    app = new PlayRTC({
      /* projectKey: '48489b46-02c5-4f22-836e-ac6620206500',
      projectKey: '5d2ac81f-1ccf-4e1c-8bef-eb3fb63e7405', */
      projectKey: '60ba608a-e228-4530-8711-fa38004719c1', /* ê¸°ë³¸í¤ */
      localMediaTarget: 'localVideo',
      remoteMediaTarget: 'remoteVideo'
    });
    getChannelList = function () {
      app.getChannelList(function (result) {
        var channels = result.channels;
        var channelsLength = channels.length;
        while (channelList.hasChildNodes()) {
          channelList.removeChild(channelList.firstChild);
        }
        for (var i = 0; i < channelsLength; i++) {
          var channelListAnchor = document.createElement('a');
          var linkIcon = document.createElement('span');
          channelListAnchor.classList.add('list-group-item');
          channelListAnchor.setAttribute('data-channelid', channels[i].channelId);
          channelListAnchor.textContent = channels[i].channelId;
          linkIcon.classList.add('glyphicon', 'glyphicon-menu-right', 'pull-right');
          linkIcon.setAttribute('aria-hidden', 'true');
          channelListAnchor.appendChild(linkIcon);
          channelList.appendChild(channelListAnchor);
        }
      });
    }
    getChannelList();
    app.on('connectChannel', function (channelId) {
      createChannelIdInput.value = channelId;
      getChannelList();
    });
    app.on('disconnectChannel', function (channelId) {
      createChannelIdInput.value = '';
      while (chattingTimeline.hasChildNodes()) {
        chattingTimeline.removeChild(chattingTimeline.firstChild);
      }
      getChannelList();
    });
    app.on('otherDisconnectChannel', function (channelId) {
      remoteVideo.src = '';
      while (chattingTimeline.hasChildNodes()) {
        chattingTimeline.removeChild(chattingTimeline.firstChild);
      }
      getChannelList();
    });
    app.on('addDataStream', function (pid, uid, dataChannel) {
      dataChannel.on('message', function (message) {
        var chatParagraph;
        if (message.type === 'text') {
          chatParagraph = document.createElement('p');
          chatParagraph.classList.add('local');
          chatParagraph.textContent = message.data;
          chattingTimeline.appendChild(chatParagraph);
        } else if (message.type === 'binary') {
          PlayRTC.utils.fileDownload(message.blob, message.fileName);
          sendFileToRemoteBar.style.width = '0px';
        }
      });
      dataChannel.on('progress', function (message) {
        var width = sendFileToRemoteBarWrapper.clientWidth;
        var progressbar = (width / message.fragCount) * (message.fragIndex + 1);
        if (message.totalSize === message.fragSize) {
          return;
        }
        sendFileToRemoteBar.style.width = progressbar + 'px';
      });
      dataChannel.on('error', function (event) {
        alert('ERROR. See the log.');
      });
    });
    refreshChannelButton.addEventListener('click', function (event) {
      event.preventDefault();
      getChannelList();
    }, false);
    channelList.addEventListener('click', function (event) {
      var channelId = event.target.dataset.channelid;
      userId = userIdInput.value;
      app.connectChannel(channelId, {
    	  peer: {
          uid: userId
    	  }
      });
    }, false);
    createChannelButton.addEventListener('click', function (event) {
      event.preventDefault();
      userId = userIdInput.value;
      app.createChannel({
        peer: {
          uid: userId
        }
      })
    }, false);
    disconnectChannelButton.addEventListener('click', function (event) {
      event.preventDefault();
      app.disconnectChannel();
    }, false);
    startRemoteVideoRecordButton.addEventListener('click', function (event) {
      var peers = app.getAllPeer();
      var hasPeers = peers.length > 0;
      var firstPeerMedia = peers[0].getMedia();
      event.preventDefault();
      if (hasPeers) {
        firstPeerMedia.record();
      }
    }, false);
    stopRemoteVideoRecordButton.addEventListener('click', function (event) {
      var peers = app.getAllPeer();
      var hasPeers = peers.length > 0;
      var firstPeerMedia = peers[0].getMedia();
      event.preventDefault();
      if (hasPeers) {
        firstPeerMedia.recordStop(function (blob) {
          recordedRemoteVideoBlob = blob;
        });
      }
    }, false);
    saveRemoteVideoRecordButton.addEventListener('click', function (event) {
      event.preventDefault();
      if (recordedRemoteVideoBlob) {
        PlayRTC.utils.fileDownload(recordedRemoteVideoBlob, 'remote-video.webm');
      }
    }, false);
    startLocalVideoRecordButton.addEventListener('click', function (event) {
      var media = app.getMedia();
      event.preventDefault();
      if (media) {
        media.record();
      }
    }, false);
    stopLocalVideoRecordButton.addEventListener('click', function (event) {
      var media = app.getMedia();
      event.preventDefault();
      if (media) {
        media.recordStop(function (blob) {
          recordedLocalVideoBlob = blob;
        });
      }
    }, false);
    saveLocalVideoRecordButton.addEventListener('click', function (event) {
      event.preventDefault();
      if (recordedLocalVideoBlob) {
        PlayRTC.utils.fileDownload(recordedLocalVideoBlob, 'local-video.webm');
      }
    }, false);
    sendTextButton.addEventListener('click', function (event) {
      var chatParagraph;
      var message = sendMessageInput.value;
      event.preventDefault();
      if (message) {
        app.sendText(message);
        chatParagraph = document.createElement('p');
        chatParagraph.classList.add('remote');
        chatParagraph.textContent = message;
        chattingTimeline.appendChild(chatParagraph);
      }
      sendMessageInput.value = '';
    }, false);
    sendFileButton.addEventListener('click', function (event) {
      var myFile = selectFileInput.files[0];
      event.preventDefault();
      if (!myFile) {
        return false;
      }
      app.sendFile(myFile);
      selectFileInput.value = '';
    }, false);
  </script>
</body>

</html>