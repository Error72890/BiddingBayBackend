const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');


router.post('/add', (req, res) => {

    const { auctionId, userId, isCreator, bidAmt } = req.body;

    connection.query('INSERT INTO relations_auctions SET ?', { auctionId: auctionId, userId: userId, isCreator: isCreator, bidAmt: bidAmt }, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Relación creada` });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

//Doesn't require token
router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM relations_auctions`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_auctions: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

//Doesn't require token
router.get('/get/:relation_auctionsId', (req, res) => {

    const relation_auctionsId = req.params.relation_auctionsId;

    connection.query('SELECT * FROM relations_auctions WHERE relation_auctionsId = ?', [relation_auctionsId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relation_projects: results[0] });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

//Doesn't require token
router.get('/get/auction/:auctionId', (req, res) => {

    const auctionId = req.params.auctionId;

    connection.query('SELECT * FROM relations_auctions WHERE auctionId = ?', [auctionId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_auctions: results });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/user/:userId', (req, res) => {

    const userId = req.params.userId;

    connection.query('SELECT * FROM relations_auctions WHERE userId = ?', [userId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ relations_auctions: results });
                } else {
                    res.status(400).json({ error: 'No se encontró la relación solicitada' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:relation_auctionsId', verifyToken, (req, res) => {

    const relation_auctionsId = req.params.relation_auctionsId;

    const { auctionId, userId, isCreator, bidAmt  } = req.body;

    const updatedInformation = { auctionId, userId, isCreator, bidAmt };

    connection.query('UPDATE relations_auctions SET ? WHERE relation_auctionsId = ?', [updatedInformation, relation_auctionsId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Relación modificada. ID: ${relation_auctionsId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:relation_auctionsId', verifyToken, (req, res) => {

    const relation_auctionsId = req.params.relation_auctionsId;

    connection.query('DELETE FROM relations_auctions WHERE relation_auctionsId = ?', [relation_auctionsId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Relación eliminada' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

module.exports = router;