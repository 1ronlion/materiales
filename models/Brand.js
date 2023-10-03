module.exports = (sequelize, dataTypes) => {
    let alias = 'Brand';
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
};
    let config = {
        timestamps: false,
    }

    const Brand = sequelize.define(alias, cols, config); 

    Brand.associate = function (models) {
    Brand.hasMany(models.Product, { 
        as: "products",
        foreignKey: "brand_id"
    })
}

    return Brand
};