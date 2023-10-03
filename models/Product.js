module.exports = (sequelize, dataTypes) => {
    let alias = 'Product';
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        name: {
            type: dataTypes.STRING(50),
            allowNull: true
        },
        description: {
            type: dataTypes.STRING(200),
            allowNull: true
        },
        price: {
            type: dataTypes.INTEGER(11),
            allowNull: true
        },
        brand_id: {
            type: dataTypes.INTEGER(11),
            allowNull: false
        }
};
    let config = {
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: 'updated_at',
        deletedAt: false,
        underscored: true
    }
    const Product = sequelize.define(alias, cols, config); 

    Product.associate = function (models) {
        Product.belongsTo(models.Brand, { 
            as: "brand", //alias de la asociacion
            foreignKey: "brand_id"
        })
        Product.hasMany(models.Image, { 
            as: "image" //alias de la asociacion
        })
    }

    return Product
};