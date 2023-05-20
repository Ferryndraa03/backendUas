const express = require('express')
const cors = require('cors')
const port = 3300

const sequelize = require('./db.config')
sequelize.sync().then(() => console.log('database ready!'))

const userEndpoint = require('./routes/user')
const cashEndpoint = require('./routes/cash')

const app = express()
app.use(cors())
app.use(express.json())

app.use('/user', userEndpoint)
app.use('/cash', cashEndpoint)

app.listen(port,  () => console.log(`running server on port ${port}`))
