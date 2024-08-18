const express = require('express');
const router = express.Router();

// controller
const {
  fetchAllKategoriMaterialAlatUpah,
  fetchAllSubKategoriMaterialAlatUpah,
  fetchAllMaterialAlatUpah,
  fetchAllDaftarMaterialAlatUpah,

  fetchKategoriMaterialAlatUpah,
  fetchSubKategoriMaterialAlatUpah,
  fetchMaterialAlatUpah,
  fetchDaftarMaterialAlatUpah,
  
  createKategoriMaterialAlatUpah,
  createSubKategoriMaterialAlatUpah,
  createMaterialAlatUpah,
  createDaftarMaterialAlatUpah,
  
  editKategoriMaterialAlatUpah,
  editSubKategoriMaterialAlatUpah,
  editMaterialAlatUpah,
  editDaftarMaterialAlatUpah,
  
  deleteKategoriMaterialAlatUpah,
  deleteSubKategoriMaterialAlatUpah,
  deleteMaterialAlatUpah,
  deleteDaftarMaterialAlatUpah,
} = require('../controllers/materialAlatUpah.controller');

// kategori
router.get('/kategori', fetchAllKategoriMaterialAlatUpah)
router.get('/kategori/:category_id', fetchKategoriMaterialAlatUpah)
router.post('/kategori', createKategoriMaterialAlatUpah)
router.put('/kategori/:category_id', editKategoriMaterialAlatUpah)
router.delete('/kategori/:category_id', deleteKategoriMaterialAlatUpah)

// sub kategori
router.get('/subcat', fetchAllSubKategoriMaterialAlatUpah)
router.get('/subcat/:subcat_id', fetchSubKategoriMaterialAlatUpah)
router.post('/subcat', createSubKategoriMaterialAlatUpah)
router.put('/subcat/:subcat_id', editSubKategoriMaterialAlatUpah)
router.delete('/subcat/:subcat_id', deleteSubKategoriMaterialAlatUpah)

// Material Alat Upah
router.get('/material', fetchAllMaterialAlatUpah)
router.get('/material/:material_id', fetchMaterialAlatUpah)
router.post('/material', createMaterialAlatUpah)
router.put('/material/:material_id', editMaterialAlatUpah)
router.delete('/material/:material_id', deleteMaterialAlatUpah)

// Daftar Material Alat Upah
router.get('/list-material', fetchAllDaftarMaterialAlatUpah)
router.get('/list-material/:list_id', fetchDaftarMaterialAlatUpah)
router.post('/list-material', createDaftarMaterialAlatUpah)
router.put('/list-material/:list_id', editDaftarMaterialAlatUpah)
router.delete('/list-material/:list_id', deleteDaftarMaterialAlatUpah)

router.get('/', (req, res) => {
  res.status(200).send('Hello World!');
})

module.exports = router;