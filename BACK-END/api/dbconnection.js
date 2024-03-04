const mysql = require('mysql2');

// create the connection to database

//Kuson connection-------------------------------------------------------------
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '23938KusonTa',
  database: 'professordbv2'
});


//Thanawat connection----------------------------------------------------------
// const connection = mysql.createConnection({
//   host: 'localhost',
//   user: 'root',
//   password: '',
//   database: 'professorDB_v2',
//   port:3308
// });
//------------------------------------------------------------------------------



module.exports = connection;