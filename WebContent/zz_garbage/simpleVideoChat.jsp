<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">

    <link rel="stylesheet" href="https://cdn.webrtc-experiment.com/style.css">

    <title>One-to-One Video Chat using RTCMultiConnection</title>

    <meta name="description" content="One-to-One Video Chat using RTCMultiConnection. Only one user can join a room." />
    <meta name="keywords" content="WebRTC,RTCMultiConnection,Demos,Experiments,Samples,Examples" />

    <style>
        * {
            word-wrap:break-word;
        }
        video {
            object-fit: fill;
            width: 30%;
        }
        button,
        input,
        select {
            font-weight: normal;
            padding: 2px 4px;
            text-decoration: none;
            display: inline-block;
            text-shadow: none;
            font-size: 16px;
            outline: none;
        }
        .make-center {
            text-align: center;
            padding: 5px 10px;
        }
        img, input, textarea {
          max-width: 100%
        }
        @media all and (max-width: 500px) {
            .fork-left, .fork-right, .github-stargazers {
                display: none;
            }
        }
    </style>
</head>

<body>
    <article>

        <header style="text-align: center;">
            <h1>One-to-One Video Chat using RTCMultiConnection</h1>
            <p>
                <a href="https://rtcmulticonnection.herokuapp.com/">HOME</a>
                <span> &copy; </span>
                <a href="http://www.MuazKhan.com/" target="_blank">Muaz Khan</a> .
                <a href="http://twitter.com/WebRTCWeb" target="_blank" title="Twitter profile for WebRTC Experiments">@WebRTCWeb</a> .
                <a href="https://github.com/muaz-khan?tab=repositories" target="_blank" title="Github Profile">Github</a> .
                <a href="https://github.com/muaz-khan/RTCMultiConnection/issues?state=open" target="_blank">Latest issues</a> .
                <a href="https://github.com/muaz-khan/RTCMultiConnection/commits/master" target="_blank">What's New?</a>
            </p>
        </header>

        <div class="github-stargazers"></div>

        <blockquote>
            Only one user can join a room.
        </blockquote>

        <section class="experiment">
            <div class="make-center">
                <input type="text" id="room-id" value="abcdef" autocorrect=off autocapitalize=off size=20>
                <button id="open-room">Open Room</button>
                <button id="join-room">Join Room</button>
                <button id="open-or-join-room">Auto Open Or Join Room</button>

                <div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
            </div>

            <div id="videos-container"></div>
        </section>

        <script src="/dist/RTCMultiConnection.min.js"></script>

        <!-- custom layout for HTML5 audio/video elements -->
        <script src="https://cdn.webrtc-experiment.com/getMediaElement.js"></script>

        <!-- socket.io for signaling -->
        <script src="/socket.io/socket.io.js"></script>

        <script>
            // ......................................................
            // .......................UI Code........................
            // ......................................................
            document.getElementById('open-room').onclick = function() {
                disableInputButtons();
                connection.open(document.getElementById('room-id').value, function() {
                    showRoomURL(connection.sessionid);
                });
            };
            document.getElementById('join-room').onclick = function() {
                disableInputButtons();
                connection.join(document.getElementById('room-id').value);
            };
            document.getElementById('open-or-join-room').onclick = function() {
                disableInputButtons();
                connection.openOrJoin(document.getElementById('room-id').value, function(isRoomExists, roomid) {
                    if(!isRoomExists) {
                        showRoomURL(roomid);
                    }
                });
            };
            // ......................................................
            // ..................RTCMultiConnection Code.............
            // ......................................................
            var connection = new RTCMultiConnection();
            // by default, socket.io server is assumed to be deployed on your own URL
            connection.socketURL = '/';
            // comment-out below line if you do not have your own socket.io server
            // connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
            connection.socketMessageEvent = 'video-conference-demo';
            connection.session = {
                audio: true,
                video: true
            };
            connection.sdpConstraints.mandatory = {
                OfferToReceiveAudio: true,
                OfferToReceiveVideo: true
            };
            connection.videosContainer = document.getElementById('videos-container');
            connection.onstream = function(event) {
                var width = parseInt(connection.videosContainer.clientWidth / 2) - 20;
                var mediaElement = getMediaElement(event.mediaElement, {
                    title: event.userid,
                    buttons: ['full-screen'],
                    width: width,
                    showOnMouseEnter: false
                });
                connection.videosContainer.appendChild(mediaElement);
                setTimeout(function() {
                    mediaElement.media.play();
                }, 5000);
                mediaElement.id = event.streamid;
            };
            connection.onstreamended = function(event) {
                var mediaElement = document.getElementById(event.streamid);
                if(mediaElement) {
                    mediaElement.parentNode.removeChild(mediaElement);
                }
            };
            function disableInputButtons() {
                document.getElementById('open-or-join-room').disabled = true;
                document.getElementById('open-room').disabled = true;
                document.getElementById('join-room').disabled = true;
                document.getElementById('room-id').disabled = true;
            }
            // ......................................................
            // ......................Handling Room-ID................
            // ......................................................
            function showRoomURL(roomid) {
                var roomHashURL = '#' + roomid;
                var roomQueryStringURL = '?roomid=' + roomid;
                var html = '<h2>Unique URL for your room:</h2><br>';
                html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
                html += '<br>';
                html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';
                var roomURLsDiv = document.getElementById('room-urls');
                roomURLsDiv.innerHTML = html;
                roomURLsDiv.style.display = 'block';
            }
            (function() {
                var params = {},
                    r = /([^&=]+)=?([^&]*)/g;
                function d(s) {
                    return decodeURIComponent(s.replace(/\+/g, ' '));
                }
                var match, search = window.location.search;
                while (match = r.exec(search.substring(1)))
                    params[d(match[1])] = d(match[2]);
                window.params = params;
            })();
            var roomid = '';
            if (localStorage.getItem(connection.socketMessageEvent)) {
                roomid = localStorage.getItem(connection.socketMessageEvent);
            } else {
                roomid = connection.token();
            }
            document.getElementById('room-id').value = roomid;
            document.getElementById('room-id').onkeyup = function() {
                localStorage.setItem(connection.socketMessageEvent, this.value);
            };
            var hashString = location.hash.replace('#', '');
            if(hashString.length && hashString.indexOf('comment-') == 0) {
              hashString = '';
            }
            var roomid = params.roomid;
            if(!roomid && hashString.length) {
                roomid = hashString;
            }
            if(roomid && roomid.length) {
                document.getElementById('room-id').value = roomid;
                localStorage.setItem(connection.socketMessageEvent, roomid);
                // auto-join-room
                (function reCheckRoomPresence() {
                    connection.checkPresence(roomid, function(isRoomExists) {
                        if(isRoomExists) {
                            connection.join(roomid);
                            return;
                        }
                        setTimeout(reCheckRoomPresence, 5000);
                    });
                })();
                disableInputButtons();
            }
            // to make it one-to-one
            connection.maxParticipantsAllowed = 1;
            connection.onRoomFull = function(roomid) {
              connection.closeSocket();
              connection.attachStreams.forEach(function(stream) {
                stream.stop();
              });
              document.getElementById('open-or-join-room').disabled = false;
              document.getElementById('open-room').disabled = false;
              document.getElementById('join-room').disabled = false;
              document.getElementById('room-id').disabled = false;
              alert('Room is full.');
            };
        </script>

        <section class="experiment own-widgets latest-commits">
            <h2 class="header" id="updates" style="color: red;padding-bottom: .1em;"><a href="https://github.com/muaz-khan/RTCMultiConnection/commits/master">Latest Updates</a></h2>
            <div id="github-commits"></div>
        </section>

        <section class="experiment own-widgets">
            <h2 class="header" id="updates" style="color: red;padding-bottom: .1em;"><a href="https://github.com/muaz-khan/RTCMultiConnection/issues">Latest Issues</a></h2>
            <div id="github-issues"></div>
        </section>

        <section class="experiment">
            <h2 class="header" id="feedback">Feedback</h2>
            <div>
                <textarea id="message" style="height: 8em; margin: .2em; width: 98%; border: 1px solid rgb(189, 189, 189); outline: none; resize: vertical;" placeholder="Have any message? Suggestions or something went wrong?"></textarea>
            </div>
            <button id="send-message" style="font-size: 1em;">Send Message</button><small style="margin-left:1em;">Enter your email too; if you want "direct" reply!</small>
        </section>

        <a href="https://github.com/muaz-khan/RTCMultiConnection" class="fork-left"></a>

        <script>
            window.useThisGithubPath = 'muaz-khan/RTCMultiConnection';
        </script>
        <script src="https://cdn.webrtc-experiment.com/commits.js" async></script>

    </article>

    <footer>
        <p>
            <a href="https://www.webrtc-experiment.com">WebRTC Experiments</a> © <a href="https://plus.google.com/+MuazKhan" rel="author" target="_blank">Muaz Khan</a>
            <a href="mailto:muazkh@gmail.com" target="_blank">muazkh@gmail.com</a>
            <a href="https://github.com/muaz-khan" target="_blank">Github</a>
        </p>
    </footer>

</body>

</html>