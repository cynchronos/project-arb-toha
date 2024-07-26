require('../../config/database.json');
const { KategoriMaterialAlatUpah } = require('../models');

async function getAllKategori() {
  try {
    const record = await KategoriMaterialAlatUpah.findAll();
    // console.log(record);

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data kategori',
      errors: error
    }

    throw errors;
  }
}

async function getKategoriByQuery(query = 'category_id', value = '') {
  try {
    const record = await KategoriMaterialAlatUpah.findOne({
      where: {
        [query]: value
      }
    });

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data kategori',
      errors: error
    }

    throw errors;
  }
}

module.exports = {
  getAllKategori,
  getKategoriByQuery,
}