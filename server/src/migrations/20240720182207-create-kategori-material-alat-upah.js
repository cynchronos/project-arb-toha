'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('kategori_material_alat_upah', {
      category_id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING(5),
      },
      category_name: {
        type: Sequelize.STRING(30),
        allowNull: false,
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
    await queryInterface.dropTable('kategori_material_alat_upah');
  }
};