const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');

router.post('/add', verifyToken, (req, res) => {

    const { objectName, description, categories, startDate, endDate, img, minBid, minBidIncrement } = req.body;

    connection.query('INSERT INTO auctions SET ?', { objectName: objectName, description: description, categories: categories, startDate: startDate, endDate: endDate, img: img, minBid: minBid, minBidIncrement: minBidIncrement}, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({
                    auctionId: results.insertId,
                    response: `Registro de subasta exitosa. ID: ${results.insertId}`
                });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

//Doesn't require token
router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM auctions WHERE endDate > NOW()`, (error, results) => {
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

router.get('/get-by-category/:category', (req, res) => {
    
    const category = req.params.category;

    
    connection.query('SELECT * FROM auctions WHERE FIND_IN_SET(?, categories) > 0', [category], (error, results) => {
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

router.get('/get/:auctionId', (req, res) => {

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

    const { name, description, categories, startDate, endDate, img, minBid, minBidIncrement } = req.body;

    const updatedInformation = { name, description, categories, startDate, endDate, img, minBid, minBidIncrement };

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