const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');


router.post('/add', (req, res) => {

    const { auctionId, creatorUserId, minStartBid } = req.body;
    
    const bidderUserID = -1;
    const currentMaxBid = minStartBid;

    connection.query('INSERT INTO relations_auctions SET ?', { projectId: projectId, taskId: taskId, creatorUserId: creatorUserId, bidderUserID: bidderUserID, minStartBid: minStartBid, currentMaxBid: 0 }, (error, results) => {
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

router.get('/get-all', verifyToken, (req, res) => {

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

router.get('/get/:relations_auctionsID', verifyToken, (req, res) => {

    const relations_auctionsID = req.params.relations_auctionsID;

    connection.query('SELECT * FROM relations_auctions WHERE relations_auctionsID = ?', [relations_auctionsID], (error, results) => {
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

router.get('/get/project/:auctionID', verifyToken, (req, res) => {

    const auctionID = req.params.auctionID;

    connection.query('SELECT * FROM relations_auctions WHERE auctionID = ?', [auctionID], (error, results) => {
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

router.get('/get/user/:userId', verifyToken, (req, res) => {

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

router.put('/edit/:relations_auctionsID', verifyToken, (req, res) => {

    const relations_auctionsID = req.params.relations_auctionsID;

    const { auctionId, creatorUserId, minStartBid, bidderUserID, currentMaxBid  } = req.body;

    const updatedInformation = { auctionId, creatorUserId, bidderUserID, minStartBid, currentMaxBid };

    connection.query('UPDATE relations_auctions SET ? WHERE relations_auctionsID = ?', [updatedInformation, relations_auctionsID], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Relación modificada. ID: ${relations_auctionsID}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:relations_auctionsID', verifyToken, (req, res) => {

    const relations_auctionsID = req.params.relations_auctionsID;

    connection.query('DELETE FROM relations_auctions WHERE relations_auctionsID = ?', [relations_auctionsID], (error, results) => {

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