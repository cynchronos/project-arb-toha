'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class DaftarMaterialAlatUpah extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here

      DaftarMaterialAlatUpah.belongsTo(models.MaterialAlatUpah, {
        foreignKey: 'material_id',
        targetKey: 'material_id',
        as: 'materialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });

      // DaftarMaterialAlatUpah.belongsTo(models.Satuan, {
      //   foreignKey: 'satuan_id',
      //   targetKey: 'satuan_id',
      //   as: 'satuan',
      //   onUpdate : 'CASCADE',
      //   onDelete : 'CASCADE'
      // });
    }
  }
  DaftarMaterialAlatUpah.init({
    list_id: {
      type: DataTypes.STRING(5),
      primaryKey: true,
    },
    material_id: DataTypes.STRING(5),
    satuan: DataTypes.STRING(5),
    harga: DataTypes.INTEGER,
    area: DataTypes.TEXT,
    bulan_tahun: DataTypes.DATEONLY,
  }, {
    sequelize,
    modelName: 'DaftarMaterialAlatUpah',
    tableName: 'daftar_material_alat_upah',
  });
  return DaftarMaterialAlatUpah;
};