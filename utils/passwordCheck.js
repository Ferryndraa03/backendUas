const bycrypt = require('bcrypt')   
const ModelUser = require('../models/user')

const passwordCheck = async(nip, password) => {
    const dataUser  = await ModelUser.findOne({ where: { nip: nip } })  
    const compare = await bycrypt.compare(password, dataUser.password)
    return {compare, dataUser}
}

module.exports = passwordCheck 