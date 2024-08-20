const { check, validationResult } = require('express-validator')
const randomstring = require('randomstring')

//! Input Validation

async function validateKategoriInfo(req, res, next) {
  try {
    await check('category_name', 'Nama kategori tidak boleh kosong').notEmpty().run(req)

    const errors = validationResult(req)

    if (!errors.isEmpty()) {
      const error = new Error(errors.array()[0].msg)
      error.code = 422
      throw error;
    }

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal validasi data kategori',
      errors: error
    }

    throw errors;
  }
}

async function validateSubKategoriInfo(req, res, next) {
  try {
    await check('subcat_name', 'Nama sub kategori tidak boleh kosong').notEmpty().run(req)

    const errors = validationResult(req)

    if (!errors.isEmpty()) {
      const error = new Error(errors.array()[0].msg)
      error.code = 422
      throw error;
    }

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal validasi data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function validateMaterialAlatUpahInfo(req, res, next) {
  try {
    await check('subcat_id', 'Sub Kategori tidak boleh kosong').notEmpty().run(req)
    await check('name', 'Nama material tidak boleh kosong').notEmpty().run(req)

    const errors = validationResult(req)

    if (!errors.isEmpty()) {
      const error = new Error(errors.array()[0].msg)
      error.code = 422
      throw error;
    }

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal validasi data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function validateDaftarMaterialAlatUpahInfo(req, res, next) {
  try {
    await check('material_id', 'Material tidak boleh kosong').notEmpty().run(req)
    await check('satuan', 'Satuan tidak boleh kosong').notEmpty().isLength({max: 5}).withMessage('Input tidak boleh lebih dari 5').run(req)
    await check('harga', 'Harga tidak boleh kosong').notEmpty().run(req)
    await check('area', 'Area tidak boleh kosong').notEmpty().run(req)

    const errors = validationResult(req)

    if (!errors.isEmpty()) {
      const error = new Error(errors.array()[0].msg)
      error.code = 422
      throw error;
    }

    return true;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal validasi data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}

//! Kategori Material Alat Upah
async function validateGetKategori(categoryData) {
  try {
    // console.log(categoryData.length)
    if (!categoryData || categoryData.length == 0) {
      const errors = {
        success: false,
        code: 404,
        message: 'Kategori tidak ditemukan',
      }

      throw errors;
    }

    return categoryData;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal mendapatkan data kategori',
      errors: error
    }

    throw errors;
  }
}

async function validateCreateKategori(categoryData, newCategory) {
  try {

    if (categoryData) {
      const errors = {
        success: false,
        code: 400,
        message: 'Kategori sudah ada',
      }

      throw errors;
    }

    newCategory.category_id = randomstring.generate({
      length: 5,
      charset: 'alphabetic',
      capitalization: 'uppercase',
    });

    return newCategory;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal membuat data kategori',
      errors: error
    }

    throw errors;
  }
}

async function validateEditKategori(categoryData, categoryDataName, newCategory) {
  try {
    if (categoryDataName && categoryData.category_id !== categoryDataName.category_id) {
      const errors = {
        success: false,
        code: 400,
        message: 'Nama kategori sudah ada',
      }

      throw errors;
    }

    const updatedCategoryData = {
      ...categoryData.dataValues,
      ...newCategory,
    };

    return updatedCategoryData;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal Edit data kategori',
      errors: error
    }

    throw errors;
  }
}

//! sub kategori Material Alat Upah
async function validateGetSubKategori(subCategoryData) {
  try {
    if (!subCategoryData || subCategoryData.length === 0) {
      const errors = {
        success: false,
        code: 404,
        message: 'Sub Kategori tidak ditemukan',
      }

      throw errors;
    }

    let subCategories = [];

    if (Array.isArray(subCategoryData)) {
      subCategories = subCategoryData.map((subCategory) => {
        return {
          subcat_id: subCategory.subcat_id,
          subcat_name: subCategory.subcat_name,
          category_id: subCategory.category_id,
          category_name: subCategory.kategoriMaterialAlatUpah.category_name,
        }
      })
    } else {
      subCategories = {
        subcat_id: subCategoryData.subcat_id,
        subcat_name: subCategoryData.subcat_name,
        category_id: subCategoryData.category_id,
        category_name: subCategoryData.kategoriMaterialAlatUpah.category_name,
      }
    }


    return subCategories;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal mendapatkan data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function validateCreateSubKategori(subCategoryData, newSubCategory) {
  try {

    if (subCategoryData) {
      const errors = {
        success: false,
        code: 400,
        message: 'Sub Kategori sudah ada',
      }

      throw errors;
    }

    newSubCategory.subcat_id = randomstring.generate({
      length: 5,
      charset: 'alphabetic',
      capitalization: 'uppercase',
    });

    return newSubCategory;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal membuat data sub kategori',
      errors: error
    }

    throw errors;
  }
}

async function validateEditSubKategori(subCategoryData, subCategoryDataName, newSubCategory) {
  try {
    if (subCategoryDataName && subCategoryData.subcat_id !== subCategoryDataName.subcat_id) {
      const errors = {
        success: false,
        code: 400,
        message: 'Nama sub kategori sudah ada',
      }

      throw errors;
    }

    const updatedSubCategoryData = {
      ...subCategoryData.dataValues,
      ...newSubCategory,
    };

    return updatedSubCategoryData;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal Edit data sub kategori',
      errors: error
    }

    throw errors;
  }
}

//! Material Alat Upah

async function validateGetMaterialAlatUpah(materialData) {
  try {
    if (!materialData || materialData.length === 0) {
      const errors = {
        success: false,
        code: 404,
        message: 'Material Alat Upah tidak ditemukan',
      }

      throw errors;
    }

    let materials = [];

    if (Array.isArray(materialData)) {
      materials = materialData.map((material) => {
        return {
          category_id: material.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_id,
          category_name: material.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_name,
          subcat_id: material.subcat_id,
          subcat_name: material.subKategoriMaterialAlatUpah.subcat_name,
          material_id: material.material_id,
          material_name: material.name,
        }
      })
    } else {
      materials = {
        category_id: materialData.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_id,
        category_name: materialData.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_name,
        subcat_id: materialData.subcat_id,
        subcat_name: materialData.subKategoriMaterialAlatUpah.subcat_name,
        material_id: materialData.material_id,
        material_name: materialData.name,
      }
    }

    return materials;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal mendapatkan data material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function validateCreateMaterialAlatUpah(materialData, newMaterial) {
  try {

    if (materialData) {
      const errors = {
        success: false,
        code: 400,
        message: 'Material sudah ada',
      }

      throw errors;
    }

    newMaterial.material_id = randomstring.generate({
      length: 5,
      charset: 'alphabetic',
      capitalization: 'uppercase',
    });

    return newMaterial;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal membuat data material',
      errors: error
    }

    throw errors;
  }
}

async function validateEditMaterialAlatUpah(materialData, materialDataName, newMaterial) {
  try {
    if (materialDataName && materialData.material_id !== materialDataName.material_id) {
      const errors = {
        success: false,
        code: 400,
        message: 'Nama material sudah ada',
      }

      throw errors;
    }

    const updatedMaterialData = {
      ...materialData.dataValues,
      ...newMaterial,
    };

    return updatedMaterialData;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal Edit data material',
      errors: error
    }

    throw errors;
  }
}

async function validateGetDaftarMaterialAlatUpah(daftarMaterialData) {
  try {
    if (!daftarMaterialData || daftarMaterialData.length < 1) {
      const errors = {
        success: false,
        code: 404,
        message: 'Daftar Material Alat Upah tidak ditemukan',
      }

      throw errors;
    }

    let daftarMaterials = [];

    if (Array.isArray(daftarMaterialData)) {
      daftarMaterials = daftarMaterialData.map((daftarMaterial) => {
        return {
          list_id: daftarMaterial.list_id,
          category_id: daftarMaterial.materialAlatUpah.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_id,
          category_name: daftarMaterial.materialAlatUpah.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_name,
          subcat_id: daftarMaterial.materialAlatUpah.subcat_id,
          subcat_name: daftarMaterial.materialAlatUpah.subKategoriMaterialAlatUpah.subcat_name,
          material_id: daftarMaterial.material_id,
          material_name: daftarMaterial.materialAlatUpah.name,
          satuan_id: daftarMaterial.satuan_id,
          satuan_name: daftarMaterial.satuan.satuan_name,
          harga: daftarMaterial.harga,
          area: daftarMaterial.area,
          bulan_tahun: daftarMaterial.bulan_tahun,
        }
      })
    } else {
      daftarMaterials = {
        list_id: daftarMaterialData.list_id,
        category_id: daftarMaterialData.materialAlatUpah.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_id,
        category_name: daftarMaterialData.materialAlatUpah.subKategoriMaterialAlatUpah.kategoriMaterialAlatUpah.category_name,
        subcat_id: daftarMaterialData.materialAlatUpah.subcat_id,
        subcat_name: daftarMaterialData.materialAlatUpah.subKategoriMaterialAlatUpah.subcat_name,
        material_id: daftarMaterialData.material_id,
        material_name: daftarMaterialData.materialAlatUpah.name,
        satuan_id: daftarMaterialData.satuan_id,
        satuan_name: daftarMaterialData.satuan.satuan_name,
        harga: daftarMaterialData.harga,
        area: daftarMaterialData.area,
        bulan_tahun: daftarMaterialData.bulan_tahun,
      }
    }

    return daftarMaterials;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal mendapatkan data daftar material alat upah',
      errors: error
    }

    throw errors;
  }
}

async function validateCreateDaftarMaterialAlatUpah(newDaftarMaterial) {
  try {
    newDaftarMaterial.list_id = randomstring.generate({
      length: 5,
      charset: 'alphabetic',
      capitalization: 'uppercase',
    });

    return newDaftarMaterial;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal membuat data daftar material',
      errors: error
    }

    throw errors;
  }
}

async function validateEditDaftarMaterialAlatUpah(daftarMaterialData, newDaftarMaterial) {
  try {
    const updatedDaftarMaterialData = {
      ...daftarMaterialData.dataValues,
      ...newDaftarMaterial,
    };

    return updatedDaftarMaterialData;
  } catch (error) {
    const errors = {
      success: false,
      code: error.code ?? 500,
      message: error.message ?? 'Gagal Edit data daftar material',
      errors: error
    }

    throw errors;
  }
}

module.exports = {
  validateKategoriInfo,
  validateSubKategoriInfo,
  validateMaterialAlatUpahInfo,
  validateDaftarMaterialAlatUpahInfo,

  validateGetKategori,
  validateCreateKategori,
  validateEditKategori,

  validateGetSubKategori,
  validateCreateSubKategori,
  validateEditSubKategori,

  validateGetMaterialAlatUpah,
  validateCreateMaterialAlatUpah,
  validateEditMaterialAlatUpah,

  validateGetDaftarMaterialAlatUpah,
  validateCreateDaftarMaterialAlatUpah,
  validateEditDaftarMaterialAlatUpah,
}