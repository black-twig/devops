'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';
//const PORT = 3000;
//const HOST = 'localhost';


// App
const app = express();
app.get('/', (req, res) => {
  res.send('<H1>Hello the Dockers World!</H1>');
});

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});