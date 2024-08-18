require('../../config/database.json');
const { Op } = require('sequelize');
const { KategoriMaterialAlatUpah, SubKategoriMaterialAlatUpah, MaterialAlatUpah, DaftarMaterialAlatUpah, Satuan } = require('../models');

//! Kategori Material Alat Upah

async function getAllKategori(value = '') {
  try {
    const record = await KategoriMaterialAlatUpah.findAll({
      where: {
        [Op.or]: [
          {
            category_id: {
              [Op.like]: `%${value}%`
            }
          },
          {
            category_name: {
              [Op.like]: `%${value}%`
            }
          }
        ]
      }
    });
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

async function storeKategori(categoryData) {
  try {
    await KategoriMaterialAlatUpah.create(categoryData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal membuat data kategori',
      errors: error
    }

    throw errors;
  }
}

async function updateKategori(categoryData, updatedCategoryData) {
  try {
    await categoryData.update(updatedCategoryData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal update data kategori',
      errors: error
    }

    throw errors;
  }
}

async function destroyKategori(category) {
  try {
    await category.destroy()

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal delete data kategori',
      errors: error
    }

    throw errors;
  }
}

//! Sub Kategori Material Alat Upah

async function getAllSubKategori(value = '') {
  try {
    const record = await SubKategoriMaterialAlatUpah.findAll({
      where: {
        [Op.or]: [
          {
            subcat_id: {
              [Op.like]: `%${value}%`
            }
          },
          {
            subcat_name: {
              [Op.like]: `%${value}%`
            }
          }
        ],
      },
      include: [
        {
          model: KategoriMaterialAlatUpah,
          as: 'kategoriMaterialAlatUpah',
        }
      ]
    })

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function getSubKategoriByQuery(query = 'subcat_id', value = '') {
  try {
    const record = await SubKategoriMaterialAlatUpah.findOne({
      where: {
        [query]: value
      },
      include: [
        {
          model: KategoriMaterialAlatUpah,
          as: 'kategoriMaterialAlatUpah',
        }
      ]
    });

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function storeSubKategori(subCategoryData) {
  try {
    await SubKategoriMaterialAlatUpah.create(subCategoryData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal membuat data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function updateSubKategori(subCategoryData, updatedSubCategoryData) {
  try {
    await subCategoryData.update(updatedSubCategoryData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal update data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function destroySubKategori(subCategory) {
  try {
    await subCategory.destroy()

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal delete data sub kategori',
      errors: error
    }

    throw errors;
  }
}

//! Material Alat Upah

async function getAllMaterialAlatUpah(value = '') {
  try {
    const record = await MaterialAlatUpah.findAll({
      where: {
        [Op.or]: [
          {
            material_id: {
              [Op.like]: `%${value}%`
            }
          },
          {
            name: {
              [Op.like]: `%${value}%`
            }
          }
        ]
      },
      include: {
        model: SubKategoriMaterialAlatUpah,
        as: 'subKategoriMaterialAlatUpah',
        include: {
          model: KategoriMaterialAlatUpah,
          as: 'kategoriMaterialAlatUpah',
        }
      }
    });
    
    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function getMaterialAlatUpahByQuery(query = 'material_id', value = '') {
  try {
    const record = await MaterialAlatUpah.findOne({
      where: {
        [query]: value
      },
      include: {
        model: SubKategoriMaterialAlatUpah,
        as: 'subKategoriMaterialAlatUpah',
        include: {
          model: KategoriMaterialAlatUpah,
          as: 'kategoriMaterialAlatUpah',
        }
      }
    });

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function storeMaterialAlatUpah(materialData) {
  try {
    await MaterialAlatUpah.create(materialData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal membuat data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function updateMaterialAlatUpah(materialData, updatedMaterialData) {
  try {
    await materialData.update(updatedMaterialData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal update data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function destroyMaterialAlatUpah(material) {
  try {
    await material.destroy()

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal delete data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function getAllDaftarMaterialAlatUpah(value = '') {
  try {
    const record = await DaftarMaterialAlatUpah.findAll({
      where: {
        [Op.or]: [
          {
            list_id: {
              [Op.like]: `%${value}%`
            }
          },
          {
            material_id: {
              [Op.like]: `%${value}%`
            }
          }
        ]
      },
      include:[
        {
          model: MaterialAlatUpah,
          as: 'materialAlatUpah',
          include:
            {
              model: SubKategoriMaterialAlatUpah,
              as: 'subKategoriMaterialAlatUpah',
              include: 
                {
                  model: KategoriMaterialAlatUpah,
                  as: 'kategoriMaterialAlatUpah',
                }
            }
        },
      ],
    });

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function getDaftarMaterialAlatUpahByQuery(query = 'list_id', value = '') {
  try {
    const record = await DaftarMaterialAlatUpah.findOne({
      where: {
        [query]: value
      },
      include:[
        {
          model: MaterialAlatUpah,
          as: 'materialAlatUpah',
          include:
            {
              model: SubKategoriMaterialAlatUpah,
              as: 'subKategoriMaterialAlatUpah',
              include: 
                {
                  model: KategoriMaterialAlatUpah,
                  as: 'kategoriMaterialAlatUpah',
                }
            }
        },
      ],
    });

    return record;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal mendapatkan data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function storeDaftarMaterialAlatUpah(daftarMaterialData) {
  try {
    await DaftarMaterialAlatUpah.create(daftarMaterialData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal membuat data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function updateDaftarMaterialAlatUpah(daftarMaterialData, updatedDaftarMaterialData) {
  try {
    await daftarMaterialData.update(updatedDaftarMaterialData);

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal update data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function destroyDaftarMaterialAlatUpah(daftarMaterial) {
  try {
    await daftarMaterial.destroy()

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: 400,
      message: 'Gagal delete data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}


module.exports = {
  getAllKategori,
  getKategoriByQuery,
  storeKategori,
  updateKategori,
  destroyKategori,

  getAllSubKategori,
  getSubKategoriByQuery,
  storeSubKategori,
  updateSubKategori,
  destroySubKategori,
  
  getAllMaterialAlatUpah,
  getMaterialAlatUpahByQuery,
  storeMaterialAlatUpah,
  updateMaterialAlatUpah,
  destroyMaterialAlatUpah,

  getAllDaftarMaterialAlatUpah,
  getDaftarMaterialAlatUpahByQuery,
  storeDaftarMaterialAlatUpah,
  updateDaftarMaterialAlatUpah,
  destroyDaftarMaterialAlatUpah,
}