import socketIOClient from 'socket.io-client';

const socket = io('https://chat-app-b7o4.onrender.com'); // <-- koristiš URL sa Rendera

function getMessage(cb) {
  socket.on('message', data => {
    cb(data);
  });
}
function sendMessage(message) {
  socket.emit('message', message);
}

export { getMessage, sendMessage };
