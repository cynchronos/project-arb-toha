const {
  validateKategoriInfo,
  validateSubKategoriInfo,
  validateMaterialAlatUpahInfo,
  validateDaftarMaterialAlatUpahInfo,

  validateGetKategori,
  validateGetSubKategori,
  validateGetMaterialAlatUpah,
  validateGetDaftarMaterialAlatUpah,

  validateCreateKategori,
  validateCreateSubKategori,
  validateCreateMaterialAlatUpah,
  validateCreateDaftarMaterialAlatUpah,

  validateEditKategori,
  validateEditSubKategori,
  validateEditMaterialAlatUpah,
  validateEditDaftarMaterialAlatUpah,
} = require('../validations/materialAlatUpah.validation')

const {
  getAllKategori,
  getAllSubKategori,
  getAllMaterialAlatUpah,
  getAllDaftarMaterialAlatUpah,

  getKategoriByQuery,
  getSubKategoriByQuery,
  getMaterialAlatUpahByQuery,
  getDaftarMaterialAlatUpahByQuery,

  storeKategori,
  storeSubKategori,
  storeMaterialAlatUpah,
  storeDaftarMaterialAlatUpah,

  updateKategori,
  updateSubKategori,
  updateMaterialAlatUpah,
  updateDaftarMaterialAlatUpah,

  destroyKategori,
  destroySubKategori,
  destroyMaterialAlatUpah,
  destroyDaftarMaterialAlatUpah,
} = require('../services/materialAlatUpah.service');
const { up } = require('../migrations/20240721143732-create-daftar-material-alat-upah');


//! Kategori Material Alat Upah
exports.fetchAllKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { query } = req.query;

    const kategoriData = await getAllKategori(query);
    // console.log(kategoriData)

    await validateGetKategori(kategoriData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data kategori',
      data: kategoriData,
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.fetchKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { category_id } = req.params;

    const kategoriData = await getKategoriByQuery('category_id', category_id);

    await validateGetKategori(kategoriData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data kategori',
      data: kategoriData
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
};

exports.createKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const category = req.body;

    await validateKategoriInfo(req)

    const categoryData = await getKategoriByQuery('category_name', category.category_name);

    const newCategory = await validateCreateKategori(categoryData, category);

    await storeKategori(newCategory);

    return res.status(200).json({
      success: true,
      message: 'Berhasil membuat data kategori',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.editKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { category_id } = req.params;
    const newCategory = req.body;

    const categoryData = await getKategoriByQuery('category_id', category_id);
    const categoryDataName = await getKategoriByQuery('category_name', newCategory.category_name);

    await validateKategoriInfo(req);
    await validateGetKategori(categoryData);

    const updatedCategoryData = await validateEditKategori(categoryData, categoryDataName, newCategory);

    await updateKategori(categoryData, updatedCategoryData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mengubah data kategori',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.deleteKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { category_id } = req.params;

    const categoryData = await getKategoriByQuery('category_id', category_id);

    await validateGetKategori(categoryData);

    await destroyKategori(categoryData);
    return res.status(200).json({
      success: true,
      message: 'Berhasil menghapus data kategori',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

//! Sub Kategori Material Alat Upah

exports.fetchAllSubKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { query } = req.query;

    const subKategoriData = await getAllSubKategori(query);
    const subCategories = await validateGetSubKategori(subKategoriData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data sub kategori',
      data: subCategories,
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.fetchSubKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { subcat_id } = req.params;

    const subKategoriData = await getSubKategoriByQuery('subcat_id', subcat_id);
    const subCategories = await validateGetSubKategori(subKategoriData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data sub kategori',
      data: subCategories,
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.createSubKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const subCategory = req.body;

    await validateSubKategoriInfo(req);

    const subCategoryData = await getSubKategoriByQuery('subcat_name', subCategory.subcat_name);
    const kategoriData = await getKategoriByQuery('category_id', subCategory.category_id);
    await validateGetKategori(kategoriData);

    const newSubCategory = await validateCreateSubKategori(subCategoryData, subCategory);


    await storeSubKategori(newSubCategory);

    return res.status(200).json({
      success: true,
      message: 'Berhasil membuat data sub kategori',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.editSubKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { subcat_id } = req.params;
    const newSubCategory = req.body;

    await validateSubKategoriInfo(req);

    const subCategoryData = await getSubKategoriByQuery('subcat_id', subcat_id);
    const categoryData = await getKategoriByQuery('category_id', newSubCategory.category_id);
    const subCategoryDataName = await getSubKategoriByQuery('subcat_name', newSubCategory.subcat_name);

    await validateGetSubKategori(subCategoryData);
    await validateGetKategori(categoryData);

    const updatedSubCategoryData = await validateEditSubKategori(subCategoryData, subCategoryDataName, newSubCategory);

    await updateSubKategori(subCategoryData, updatedSubCategoryData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mengubah data sub kategori',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.deleteSubKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { subcat_id } = req.params;

    const subCategoryData = await getSubKategoriByQuery('subcat_id', subcat_id);

    await destroySubKategori(subCategoryData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil menghapus data sub kategori',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

//! Material Alat Upah

exports.fetchAllMaterialAlatUpah = async (req, res) => {
  try {
    const { query } = req.query;

    const materialData = await getAllMaterialAlatUpah(query);
    console.log(materialData)

    const materials = await validateGetMaterialAlatUpah(materialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data material',
      data: materials
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.fetchMaterialAlatUpah = async (req, res) => {
  try {
    const { material_id } = req.params;

    const materialData = await getMaterialAlatUpahByQuery('material_id', material_id);

    const materials = await validateGetMaterialAlatUpah(materialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data material',
      data: materials
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.createMaterialAlatUpah = async (req, res) => {
  try {
    const material = req.body;

    await validateMaterialAlatUpahInfo(req);

    const materialData = await getMaterialAlatUpahByQuery('name', material.name);
    const subCategoryData = await getSubKategoriByQuery('subcat_id', material.subcat_id);
    await validateGetSubKategori(subCategoryData);

    const newMaterial = await validateCreateMaterialAlatUpah(materialData, material);

    await storeMaterialAlatUpah(newMaterial);

    return res.status(200).json({
      success: true,
      message: 'Berhasil membuat data material',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.editMaterialAlatUpah = async (req, res) => {
  try {
    const { material_id } = req.params;
    const newMaterial = req.body;

    await validateMaterialAlatUpahInfo(req);

    const materialData = await getMaterialAlatUpahByQuery('material_id', material_id);
    const subCategoryData = await getSubKategoriByQuery('subcat_id', newMaterial.subcat_id);
    const materialDataName = await getMaterialAlatUpahByQuery('name', newMaterial.name);

    await validateGetMaterialAlatUpah(materialData);
    await validateGetSubKategori(subCategoryData);

    const updatedMaterialData = await validateEditMaterialAlatUpah(materialData, materialDataName, newMaterial);

    await updateMaterialAlatUpah(materialData, updatedMaterialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mengubah data material',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.deleteMaterialAlatUpah = async (req, res) => {
  try {
    const { material_id } = req.params;

    const materialData = await getMaterialAlatUpahByQuery('material_id', material_id);

    await validateGetMaterialAlatUpah(materialData);

    await destroyMaterialAlatUpah(materialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil menghapus data material',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

//! Daftar Material Alat Upah
exports.fetchAllDaftarMaterialAlatUpah = async (req, res) => {
  try {
    const { query } = req.query;
    let materialData = [];

    const searchQuery = [getAllDaftarMaterialAlatUpah, getAllMaterialAlatUpah, getAllSubKategori];

    if (query !== '') {
      const searchResults = await Promise.all(searchQuery.map((search) => search(query)));
      const searchData = searchResults.flat().find((result) => result);

      if(searchData) {
        materialData = await getAllDaftarMaterialAlatUpah(searchData.material_id);
      }
    } else {
      materialData = await getAllDaftarMaterialAlatUpah(query);
    }
    
    const materials = await validateGetDaftarMaterialAlatUpah(materialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data daftar material',
      data: materials,
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.fetchDaftarMaterialAlatUpah = async (req, res) => {
  try {
    const { list_id } = req.params;

    const materialData = await getDaftarMaterialAlatUpahByQuery('list_id', list_id);
    const materials = await validateGetDaftarMaterialAlatUpah(materialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data daftar material',
      data: materials
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.createDaftarMaterialAlatUpah = async (req, res) => {
  try {
    const materialList = req.body;

    await validateDaftarMaterialAlatUpahInfo(req);

    const materialData = await getMaterialAlatUpahByQuery('material_id', materialList.material_id);
    await validateGetMaterialAlatUpah(materialData);

    const newMaterial = await validateCreateDaftarMaterialAlatUpah(materialList);
    
    await storeDaftarMaterialAlatUpah(newMaterial);

    return res.status(200).json({
      success: true,
      message: 'Berhasil membuat daftar material',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.editDaftarMaterialAlatUpah = async (req, res) => {
  try {
    const { list_id } = req.params;
    const newMaterial = req.body;

    await validateDaftarMaterialAlatUpahInfo(req);

    const materialList = await getDaftarMaterialAlatUpahByQuery('list_id', list_id);

    await validateGetDaftarMaterialAlatUpah(materialList);

    const materialData = await getMaterialAlatUpahByQuery('material_id', newMaterial.material_id);
    await validateGetMaterialAlatUpah(materialData);

    const updatedMaterialList = await validateEditDaftarMaterialAlatUpah(materialList, newMaterial);

    await updateDaftarMaterialAlatUpah(materialList, updatedMaterialList);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mengubah data material',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}

exports.deleteDaftarMaterialAlatUpah = async (req, res) => {
  try {
    const { list_id } = req.params;

    const materialData = await getDaftarMaterialAlatUpahByQuery('list_id', list_id);

    await validateGetDaftarMaterialAlatUpah(materialData);

    await destroyDaftarMaterialAlatUpah(materialData);

    return res.status(200).json({
      success: true,
      message: 'Berhasil menghapus data material',
    });
  } catch (error) {
    return res.status(error.code ?? 500).json(error)
  }
}