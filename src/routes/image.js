require('dotenv').config();

const express = require('express');
const router = express.Router();
const multer = require('multer');
const { S3Client, PutObjectCommand } = require('@aws-sdk/client-s3');

// Configurar multer para manejar la carga de archivos
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

// Configuración de s3client para Cloudflare R2
const s3client = new S3Client({
  endpoint: process.env.R2_ENDPOINT, // Usa el endpoint de entorno
  region: 'auto', // Región de R2 es 'auto'
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID, // Usa el access key ID de entorno
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY, // Usa el secret access key de entorno
  },
});

// Ruta para subir la imagen
router.post('/upload', upload.single('image'), async (req, res) => {
  const file = req.file;
  const bucketName = process.env.R2_BUCKET_NAME; // Usa el nombre del bucket de entorno

  if (!file) {
    return res.status(400).send('No se ha proporcionado ninguna imagen.');
  }

  const params = {
    Bucket: bucketName,
    Key: `${Date.now()}_${file.originalname}`, // Nombre del archivo en el bucket
    Body: file.buffer,
    ContentType: file.mimetype, // Tipo de contenido del archivo
   // ACL: 'public-read', // Permitir acceso público
  };

  try {
    const command = new PutObjectCommand(params);
    await s3client.send(command);
    res.status(200).send({ imageUrl: `${process.env.IMAGE_PUBLIC_PATH}/${params.Key}` });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error subiendo la imagen.');
  }
});

module.exports = router;
