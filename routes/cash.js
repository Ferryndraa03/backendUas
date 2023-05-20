const express = require('express')
const router = express.Router()
const sequelize = require('../db.config')
const ModelCash = require('../models/cash')

//endpoint utama Method Get / Read Data
router.get('/', async(req, res) => {
    const cash = await ModelCash.findAll()
    res.status(200).json({
        data : cash,
        metadata : "Read all Data From User"
    })
})

router.get('/masuk',async (req, res) => {
    const nip = req.query.nip;
     const { Op } = require("sequelize");
    const cash = await ModelCash.findAll({ 
      where: {
          [Op.and] : [
              {nip : nip},
              {kategori : 'pemasukan'}
          ]
          }
  })
  res.status(200).json({
    status : 200,
    data : cash,
    metadata : `menampilkan ${nip} on the List`
})

})
router.get('/keluar',async (req, res) => {
    const nip = req.query.nip;
     const { Op } = require("sequelize");
    const cash = await ModelCash.findAll({ 
      where: {
          [Op.and] : [
              {nip : nip},
              {kategori : 'pengeluaran'}
          ]
          }
  })
  res.status(200).json({
    status : 200,
    data : cash,
    metadata : `menampilkan ${nip} on the List`
})

})

 // const { Op } = require("sequelize");
    // const cash = await ModelCash.findAll({ 
    //     where: {
    //                 [Op.and] : [
    //                     { nip : nip },
    //                     {
    //                         tanggal : {
    //                             [Op.like]: `%${cari}%`
    //                         }
    //                     },
    //                 ]
    //             }
    // })
    //Versi Raw Query

router.post('/searchKeluar', async(req, res) => {
    
    const {cari} = req.body
    const nip  = req.query.nip

    const cash = await sequelize.query(`SELECT * FROM cash WHERE tanggal LIKE'%${cari}%' AND nip = '${nip}' AND kategori = 'pengeluaran'`)

    res.status(200).json({
        status: 200,
        data : cash[0],
        metadata : `Search ${cari} on the cash`
    })
})
router.post('/searchMasuk', async(req, res) => {
    
    const {cari} = req.body
    const nip  = req.query.nip

    const cash = await sequelize.query(`SELECT * FROM cash WHERE tanggal LIKE'%${cari}%' AND nip = '${nip}' AND kategori = 'pemasukan'`)

    res.status(200).json({
        status: 200,
        data : cash[0],
        metadata : `Search ${cari} on the cash`
    })
})



//Endpoint Method Post / Create Data
router.post('/', async(req, res) => {
    
    const {nip, kategori, catatan, nominal, tanggal} = req.body
    
    const cash = await ModelCash.create({
        nip, kategori, catatan, nominal, tanggal
    })

    res.status(200).json({
        status : 200,
        data : cash,
        metadata : "Cash Flow Added Successfully"
    })
})

//Endpoint Method Put / Update Data Mahasiswa
router.put('/', async(req, res) => {
    
    const id = req.query.id
    const {kategori, catatan, nominal, tanggal} = req.body
  
    // res.json({userData})
        const cash = await ModelCash.update({
            kategori, catatan, nominal, tanggal 
        }, { where: { id: id }})    
        res.status(200).json({
            status : 200,
            users: {updated: cash[0]},
            metadata: "Data Updates Successfuly"
        })
 
})


//Endpoint Method Delete / Delete Data Mahawaswa
router.delete('/', async(req, res) => {
    
    const id = req.query.id
  
    const cash = await ModelCash.destroy({
      where: { id : id }
    })    
    
    res.status(200).json({
        status : 200,
        data: {Deleted: cash[0]},
        metadata: "Data User Deleted Successfuly!"
    })
   
})

module.exports = router