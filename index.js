const express = require('express');
const cors = require('cors');

const userModel = require('./src/routes/user');
const auctionModel = require('./src/routes/auction');
const relationsAuctionsModel = require('./src/routes/relations_auctions');

const app = express();

const PORT = 3000;

app.use(cors({ cors: "127.0.0.1:4200" }));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


app.use('/user', userModel);
app.use('/auction', auctionModel);
app.use('/relations-auctions', relationsAuctionsModel);

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
