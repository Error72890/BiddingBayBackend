const jsonWebToken = require('jsonwebtoken');


const verifyToken = (req, res, next) => {

    const token = req.headers['authorization'];

    const secretWord = "ad[sdaq*adws";

    if (!token) {
        return res.status(403).json({ error: 'Token no proporcionado' });
    }

    if (!secretWord) {
        return res.status(403).json({ error: 'Llave secreta no proporcionada' });
    }

    jsonWebToken.verify(token, secretWord, (err, decoded) => {

        if (err) {
            return res.status(401).json({ error: 'Token no válido' });
        }

        req.user = decoded;
        next();

    });
};

module.exports = { verifyToken };
