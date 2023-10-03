module.exports = (sequelize, dataTypes) => {
    let alias = 'Image';
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        url: {
            type: dataTypes.STRING(200),
            allowNull: true
        },
        product_id: {
            type: dataTypes.INTEGER(11),
            allowNull: true
        }
};
    let config = {
        timestamps: false,
        underscored: true
    }

    const Image = sequelize.define(alias, cols, config); 

    Image.associate = function (models) {
        Image.belongsTo(models.Product, { 
            as: "products", 
            foreignKey: "product_id"
        })
    }

    return Image
};