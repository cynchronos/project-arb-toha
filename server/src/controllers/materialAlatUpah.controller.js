const {
  getAllKategori,
  getKategoriByQuery
} = require('../services/materialAlatUpah.service');

exports.fetchAllKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const kategoriData = await getAllKategori();

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data kategori',
      data: kategoriData,
    });
  } catch (error) {
    return res.status(error.code).json(error)
  }
}

exports.fetchKategoriMaterialAlatUpah = async (req, res) => {
  try {
    const { category_id } = req.params;

    const kategoriData = await getKategoriByQuery('category_id', category_id);

    return res.status(200).json({
      success: true,
      message: 'Berhasil mendapatkan data kategori',
      data: kategoriData
    });
  } catch (error) {
    return res.status(error.code).json(error)
  }
};