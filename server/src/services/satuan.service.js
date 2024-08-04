// require('../../config/database.json');
// const { Satuan } = require('../models');

// async function getAllSatuan(value = '') {
//   try {
//     const record = await Satuan.findAll({
//       where:{
//         'satuan_id': {
//           [Op.like]: `%${value}%`
//         }
//       }
//     });
    
//     return record
//   } catch (error) {
//     const errors = {
//       success: false,
//       code: 400,
//       message: 'Gagal mengambil data satuan',
//       errors: error
//     };

//     throw errors;
//   }
// }

// async function storeSatuan(data) {
//   try {
//     await Satuan.create(data);
    
//     return true;
//   } catch (error) {
//     const errors = {
//       success: false,
//       code: 400,
//       message: 'Gagal menambahkan data satuan',
//       errors: error
//     };

//     throw errors;
//   }
// }

// async function updateSatuan(data, id) {
//   try {
//     await Satuan.update(data, {
//       where: {
//         satuan_id: id
//       }
//     });
    
//     return true;
//   } catch (error) {
//     const errors = {
//       success: false,
//       code: 400,
//       message: 'Gagal mengubah data satuan',
//       errors: error
//     };

//     throw errors;
//   }
// }