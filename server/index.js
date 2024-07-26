require('./config/database.json');
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');

require('dotenv').config();

// conn
const serverHost = process.env.SERVER_HOST || 'localhost';
const clientHost = process.env.CLIENT_HOST || 'localhost';
const serverPort = process.env.PORT || 3000;
const clientPort = process.env.CLIENT_PORT || 5000;
const app = express();

// cors
app.use(cors({
  origin: `http://${clientHost}:${clientPort}`,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With', 'Accept', 'Origin'],
}));

// morgan
app.use(morgan('dev'));

// express json
app.use(express.json());

// parse application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// routes
const mainRoutes = require('./src/routes/main.routes');

app.use('/', mainRoutes);
app.use((req, res) => {
  res.status(500).send('<h1>Resource Not Found</h1>')
});

// Server listener
const server = app.listen(serverPort, serverHost, () => {
  console.log(`Server running at http://${serverHost}:${serverPort}`);
})