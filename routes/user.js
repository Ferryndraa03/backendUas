const express = require('express')
const router = express.Router()
const ModelUser = require('../models/user')
const bycrypt = require('bcrypt')
const passwordCheck = require('../utils/passwordCheck')
const sequelize = require('../db.config')

//endpoint utama Method Get / Read Data
router.get('/', async(req, res) => {
    const user = await ModelUser.findAll()
    res.status(200).json({
        data : user,
        metadata : "Read all Data From User"
    })
})

router.get('/saldo', async(req, res) => {
    
    const nip  = req.query.nip

    const cash = await sequelize.query(`SELECT saldo FROM users WHERE nip = '${nip}'`)

    res.status(200).json({
        status: 200,
        data : cash[0],
        metadata : `data saldo sukses ditampilkan`
    })
})

//Endpoint Method Post / Create Data
router.post('/', async(req, res) => {
    
    const {nip, nama, password} = req.body
    
    const encryptedPassword = await bycrypt.hash(password, 5)

    const user = await ModelUser.create({
        nip, nama, password: encryptedPassword, saldo : 0
    })

    res.status(200).json({
        status : 200,
        data : user,
        metadata : "Data user Added Successfuly"
    })
})

//endpoint method Post / Login Mahasiswa
router.post('/login', async(req, res) => {
    const {nip, password} = req.body

    const check = await passwordCheck(nip, password)
    
    if(check.compare === true){
        res.status(200).json({
            status : 200,
            users : check.dataUser,
            metadata: "Login Successfuly"
        })
    }else{
        res.status(400).json({
            error: "Data Invalid"
        })
    }
})

//Endpoint Method Put / Update Data Mahasiswa
router.put('/', async(req, res) => {
    
    const {nip, nama, password, passwordBaru} = req.body
  
    const check = await passwordCheck(nip, password)

    const encryptedPassword = await bycrypt.hash(passwordBaru, 10)

    // res.json({userData})
    if(check.compare === true){
        const users = await ModelUser.update({
            nama, password : encryptedPassword
        }, { where: { nip: nip }})    
        res.status(200).json({
            status : 200,
            users: {updated: users[0]},
            metadata: "Data User Updates Successfuly"
        })
    }else{
        res.status(400).json({
            "error": "data invalid"
        })
    }
 
})

router.put('/saldo', async(req, res) => {
    
    const {nip, saldo} = req.body
  

    // res.json({userData})
    
    const users = await ModelUser.update({
        saldo
    }, { where: { nip: nip }})    
    res.status(200).json({
        status : 200,
        users: {updated: users[0]},
        metadata: "Data User Updates Successfuly"
    })
    
 
})


//Endpoint Method Delete / Delete Data Mahawaswa
router.delete('/', async(req, res) => {
    
    const {nip} = req.body
  
    const user = await ModelUser.destroy({
      where: { nip : nip }
    })    
    
    res.status(200).json({
        data: {Deleted: user[0]},
        metadata: "Data User Deleted Successfuly!"
    })
   
})

module.exports = router