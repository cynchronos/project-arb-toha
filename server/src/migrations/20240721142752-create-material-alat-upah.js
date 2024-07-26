'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('material_alat_upah', {
      material_id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING(5)
      },
      subcat_id: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references:{
          model: 'sub_kategori_material_alat_upah',
          key: 'subcat_id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      name: {
        type: Sequelize.STRING(30),
        allowNull:false,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('material_alat_upah');
  }
};