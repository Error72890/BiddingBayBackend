const express = require('express');
const router = express.Router();
const jsonWebToken = require('jsonwebtoken');
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');

router.post('/register', (req, res) => {

    const { name, email, password, phoneNumber, adress } = req.body;

    connection.query('INSERT INTO users SET ?', { name: name, email: email, password: password, phoneNumber: phoneNumber, adress: adress}, async (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Registro de usuario exitoso. ID: ${results.insertId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

router.post('/login', (req, res) => {

    const { email, password } = req.body;
    const loginQuery = `SELECT * FROM users WHERE email = '${email}'`;

    connection.query(loginQuery, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {

                const user = results[0];

                if (user) {

                    if (user.password == password) {

                        const token = jsonWebToken.sign(user, "ad[sdaq*adws");

                        res.json({
                            ok: true,
                            userId: results[0].userId,
                            token: token
                        });

                    } else {
                        res.json({
                            ok: false,
                            msg: "Contraseña incorrecta."
                        })
                    }

                } else {
                    res.json({
                        ok: false,
                        msg: "Correo no registrado."
                    })
                }


            }

        } catch (error) {
            res.status(500).json({ error: error });
        }


    });

});

router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM users`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ users: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:userId', (req, res) => {

    const userId = req.params.userId;

    connection.query('SELECT * FROM users WHERE userId = ?', [userId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ user: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró el usuario solicitado' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:userId', verifyToken, (req, res) => {

    const userId = req.params.userId;

    const { name, email, password, phoneNumber, adress  } = req.body;

    const updatedInformation = { name, email, password, phoneNumber, adress };

    connection.query('UPDATE users SET ? WHERE userId = ?', [updatedInformation, userId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Usuario actualizado. ID: ${userId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:userId', verifyToken, (req, res) => {

    const userId = req.params.userId;

    connection.query('DELETE FROM users WHERE userId = ?', [userId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Usuario eliminado' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

module.exports = router;