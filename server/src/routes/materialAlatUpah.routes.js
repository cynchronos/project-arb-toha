const express = require('express');
const router = express.Router();

// controller
const materialAlatUpahController = require('../controllers/materialAlatUpah.controller');

router.get('/kategori', materialAlatUpahController.fetchAllKategoriMaterialAlatUpah)
router.get('/kategori/:category_id', materialAlatUpahController.fetchKategoriMaterialAlatUpah)

router.get('/', (req, res) => {
  res.status(200).send('Hello World!');
})

module.exports = router;