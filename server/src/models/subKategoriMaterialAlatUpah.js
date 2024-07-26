'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class SubKategoriMaterialAlatUpah extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */

    static associate(models) {
      // define association here
      SubKategoriMaterialAlatUpah.belongsTo(models.KategoriMaterialAlatUpah, {
        foreignKey: 'category_id',
        targetKey: 'category_id',
        as: 'kategoriMaterialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });

      SubKategoriMaterialAlatUpah.hasMany(models.MaterialAlatUpah, {
        foreignKey: 'subcat_id',
        sourceKey: 'subcat_id',
        as: 'materialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });
    }
  }
  SubKategoriMaterialAlatUpah.init({
    subcat_id: {
      type: DataTypes.STRING(5),
      primaryKey: true
    },
    category_id: DataTypes.STRING(5),
    subcat_name: DataTypes.STRING(30)
  }, {
    sequelize,
    modelName: 'SubKategoriMaterialAlatUpah',
    tableName: 'sub_kategori_material_alat_upah',
  });
  return SubKategoriMaterialAlatUpah;
};