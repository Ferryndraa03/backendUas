const {Model, DataTypes} = require('sequelize')
const sequelize = require('../db.config')

class Cash extends Model { }

Cash.init({
    nip : {
        type : DataTypes.INTEGER,
    },
    kategori : {
        type : DataTypes.STRING
    },
    catatan : {
        type : DataTypes.STRING
    },
    nominal : {
        type : DataTypes.STRING
    },
    tanggal : {
        type : DataTypes.STRING
    }
},{
    sequelize,
    modelName : 'Cash'
})

module.exports = Cash