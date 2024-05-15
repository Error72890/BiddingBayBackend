const mysql = require('mysql2');

const connection = mysql.createConnection(({
    host: 'localhost',
    user: 'root',
    database: 'biddingbaydb'
}));

connection.connect((error) => {

    if (error) {
        console.error('Error al establecer la conexión a la base de datos:', error.message);
        throw new Error('Error al establecer la conexión a la base de datos');
    }
    console.log('Conexión exitosa a la base de datos');

});

module.exports = connection;
