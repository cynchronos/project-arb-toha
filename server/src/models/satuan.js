'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Satuan extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here

      Satuan.hasMany(models.DaftarMaterialAlatUpah, {
        foreignKey: 'satuan_id',
        sourceKey: 'satuan_id',
        as: 'daftarMaterialAlatUpah',
        onUpdate : 'CASCADE',
        onDelete : 'CASCADE'
      });
    }
  }
  Satuan.init({
    satuan_id: {
      type: DataTypes.STRING,
      primaryKey: true
    }
  }, {
    sequelize,
    modelName: 'Satuan',
    tableName: 'satuan',
  });
  return Satuan;
};