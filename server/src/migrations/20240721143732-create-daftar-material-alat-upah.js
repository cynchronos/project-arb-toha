'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('daftar_material_alat_upah', {
      list_id: {
        type: Sequelize.STRING(5),
        allowNull: false,
        primaryKey: true,
      },
      material_id: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references: {
          model: 'material_alat_upah',
          key: 'material_id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      satuan_id: {
        type: Sequelize.STRING(5),
        allowNull: false,
        references: {
          model: 'satuan',
          key: 'satuan_id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      harga: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      lokasi: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      bulan_tahun: {
        type: Sequelize.DATE,
        allowNull: true
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
    await queryInterface.dropTable('daftar_material_alat_upah');
  }
};