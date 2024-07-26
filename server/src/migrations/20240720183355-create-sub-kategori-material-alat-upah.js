'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('sub_kategori_material_alat_upah', {
      subcat_id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING(5)
      },
      category_id: {
        allowNull: false,
        type: Sequelize.STRING(5),
        references:{
          model: 'kategori_material_alat_upah',
          key: 'category_id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      subcat_name: {
        allowNull: false,
        type: Sequelize.STRING(30)
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
    await queryInterface.dropTable('sub_kategori_material_alat_upah');
  }
};