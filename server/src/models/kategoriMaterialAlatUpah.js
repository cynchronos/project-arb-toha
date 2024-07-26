'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class KategoriMaterialAlatUpah extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    
    static associate(models) {
      // define association here
      KategoriMaterialAlatUpah.hasMany(models.SubKategoriMaterialAlatUpah, {
        foreignKey: 'category_id',
        sourceKey: 'category_id',
        as: 'subKategoriMaterialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });
    }
  }
  KategoriMaterialAlatUpah.init({
    category_id: {
      type: DataTypes.STRING(5),
      primaryKey: true
    },
    category_name: DataTypes.STRING(30)
  }, {
    sequelize,
    modelName: 'KategoriMaterialAlatUpah',
    tableName: 'kategori_material_alat_upah',
  });
  return KategoriMaterialAlatUpah;
};