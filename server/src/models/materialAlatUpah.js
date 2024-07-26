'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class MaterialAlatUpah extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      MaterialAlatUpah.belongsTo(models.SubKategoriMaterialAlatUpah, {
        foreignKey: 'subcat_id',
        targetKey: 'subcat_id',
        as: 'subKategoriMaterialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });

      MaterialAlatUpah.hasMany(models.DaftarMaterialAlatUpah, {
        foreignKey: 'material_id',
        sourceKey: 'material_id',
        as: 'daftarMaterialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });
    }
  }
  MaterialAlatUpah.init({
    material_id: {
      type: DataTypes.STRING(5),
      primaryKey: true
    },
    subcat_id: DataTypes.STRING(5),
    name: DataTypes.STRING(30)
  }, {
    sequelize,
    modelName: 'MaterialAlatUpah',
    tableName: 'material_alat_upah',
  });
  return MaterialAlatUpah;
};