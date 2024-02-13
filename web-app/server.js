const http = require('http');

const requestListener = function (req, res) {
    res.writeHead(200);
    console.log(`got request`);
    res.end(`Hello, from web-app`);
}

http.createServer(requestListener).listen(8080);
console.log('web server is listening');
