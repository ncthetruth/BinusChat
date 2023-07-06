const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'binuschat'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to database:', err);
  } else {
    console.log('Connected to database');
  }
});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static('Binusall'));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/Binusall/public/loginbinuschat.html');
});

app.post('/login', (req, res) => {
  const { email, password } = req.body;
  console.log(email, password);

  const query = `SELECT * FROM useraccount WHERE (Email = '${email}' OR NIM = '${email}') AND Pass = '${password}'`;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.sendStatus(500);
      return;
    }

    if (results.length > 0) {
      const { Nama, NIM, imagepath, Email} = results[0];
      res.redirect(`http://localhost:3000/chatweb?Nama=${Nama}&NIM=${NIM}&imagepath=${imagepath}&Email=${Email}`);
    } else {
      res.redirect('http://localhost:3000/');
    }
  });
});

app.get('/chatweb', (req, res) => {
  res.sendFile(__dirname + '/Binusall/public/chatweb.html');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

app.get('/search', (req, res) => {
  const searchText = req.query.searchText;

  const query = `SELECT * FROM useraccount WHERE NIM LIKE '${searchText}' OR Email LIKE '${searchText}'`;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.sendStatus(500);
      return;
    }

    res.json(results);
  });
});

app.post('/send-message', (req, res) => {
  const { message, senderId, receiverId } = req.body;

  const query = `INSERT INTO messages (messagesend, senderid, receiverid) VALUES ('${message}', '${senderId}', '${receiverId}')`;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.sendStatus(500);
      return;
    }

    res.json({ message: 'Message sent successfully' });
  });
});

  app.get('/messages', (req, res) => {
    const query = 'SELECT * FROM messages';

    connection.query(query, (error, results) => {
      if (error) {
        console.error('Error executing query:', error);
        res.sendStatus(500);
        return;
      }

      res.json(results);
    });
  });