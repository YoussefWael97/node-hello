const http = require('http');
const port = 3000;
const newrelic = require('newrelic');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = 'Hello Node!\n';
  newrelic.addCustomAttribute("check message", 1);
  res.end(msg);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});