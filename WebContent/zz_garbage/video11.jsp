<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>원격진료</title>
  <meta charset="utf-8">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
  
  <style>
    .local-video {
      width: 80px;
      height: 60px;
      z-index: 10;
      position: relative;
      top: -100px;
      right: 30px;
    }
    .remote-video {
      margin-top: 20px;
      margin-bottom: 20px;
      width: 320px;
      height: 240px;
    }
      body {
    margin: 40px 10px;
    padding: 10;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }
    
  </style>
</head>

<body>

<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %>

  <div class="container">
   	<center>	
    <div class="row">
      <div class="col-md-12"><br><br>
        <h1 class="page-header">원격진료를 시작합니다.</h1>
      </div>

      <div class="col-md-6">
        <h2 class="h3">Caller</h2>
        <h3 class="h4">Create and Connect Channel</h3>
        <form class="form-inline">
          <div class="form-group">
            <label class="sr-only" for="createChannelId">Channel Id</label>
            <input class="form-control" type="text" id="createChannelId" placeholder="Create and connect the channel." value="" readonly>
          </div>
          <button class="btn btn-default" id="createChannel">
            <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> Create Channel
          </button>
        </form>

        <video class="remote-video center-block" id="callerRemoteVideo"></video>
        <video class="local-video pull-right" id="callerLocalVideo"></video>

      </div>

      <div class="col-md-6">
        <h2 class="h3">Callee</h2>
        <h3 class="h4">Connect Channel</h3>
        <form class="form-inline">
          <div class="form-group">
            <label class="sr-only" for="connectChannelId">Channel Id</label>
            <input class="form-control" type="text" id="connectChannelId" placeholder="Enter the channel id." value="">
          </div>
          <button class="btn btn-default" id="connectChannel">
            <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Connect Channel
          </button>
        </form>

        <video class="remote-video center-block" id="calleeRemoteVideo"></video>
        <video class="local-video pull-right" id="calleeLocalVideo"></video>

      </div>

    </div>
      </center>
  </div>
  
<!-- 나가기 버튼 -->
	<p><button class="w3-button w3-section w3-teal w3-ripple w3-display-middle" type="button" 
			onclick="window.location.href='/innerpeace_aaa/member/home'"> 나가기 </button></p>
  

  <!--<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>-->
  <!--<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->

  <script src="/innerpeace_aaa/videochat/playrtc.js"></script> 
  <script src="/innerpeace_aaa/videochat/playrtc.min.js"></script>
    <script src="http://www.playrtc.com/sdk/js/playrtc.min.js"></script>
    
  <script>
    'use strict';
    var createChannelButton = document.querySelector('#createChannel');
    var createChannelId = document.querySelector('#createChannelId');
    var appCaller;
    appCaller = new PlayRTC({
      projectKey: "5d2ac81f-1ccf-4e1c-8bef-eb3fb63e7405",
      localMediaTarget: "callerLocalVideo",
      remoteMediaTarget: "callerRemoteVideo"
    });
    appCaller.on('connectChannel', function(channelId) {
        createChannelId.value = channelId;
      });

      createChannelButton.addEventListener('click', function(e) {
        e.preventDefault();          // Don't user browser default form behavior
        appCaller.createChannel();
      }, false);
  </script>
  
  <script>
    'use strict';
    var connectChannelId = document.querySelector('#connectChannelId');
    var connectChannelButton = document.querySelector('#connectChannel');
    var appCallee;
    appCallee = new PlayRTC({
      projectKey: "5d2ac81f-1ccf-4e1c-8bef-eb3fb63e7405",
      localMediaTarget: "calleeLocalVideo",
      remoteMediaTarget: "calleeRemoteVideo"
    });
    connectChannelButton.addEventListener('click', function(e) {
      e.preventDefault();
      var channelId = connectChannelId.value;
      if (!channelId) { return };
      appCallee.connectChannel(channelId);
    }, false);
  </script>
</body>
</html>