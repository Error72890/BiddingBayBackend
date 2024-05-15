const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');

router.post('/add', verifyToken, (req, res) => {

    const { name, description, categories, startDate, endDate, imgID } = req.body;

    connection.query('INSERT INTO auctions SET ?', { name: name, description: description, categories: categories, startDate: startDate, endDate: endDate, imgID: imgID }, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({
                    projectId: results.insertId,
                    response: `Registro de proyecto exitoso. ID: ${results.insertId}`
                });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get-all', verifyToken, (req, res) => {

    connection.query(`SELECT * FROM auctions`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ auctions: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:auctionId', verifyToken, (req, res) => {

    const auctionId = req.params.auctionId;

    connection.query('SELECT * FROM auctions WHERE auctionId = ?', [auctionId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ auction: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró la subasta solicitada.' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:auctionId', verifyToken, (req, res) => {

    const auctionId = req.params.auctionId;

    const { name, description, categories, startDate, endDate, imgID } = req.body;

    const updatedInformation = { name, description, categories, startDate, endDate, imgID };

    connection.query('UPDATE auctions SET ? WHERE auctionId = ?', [updatedInformation, auctionId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Subasta actualizado. ID: ${auctionId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:auctionId', verifyToken, (req, res) => {

    const auctionId = req.params.auctionId;

    connection.query('DELETE FROM auctions WHERE auctionId = ?', [auctionId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Subasta eliminada.' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

module.exports = router;