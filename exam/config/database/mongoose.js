const mongoose  = require('mongoose')
const fs        = require('fs')
const path      = require('path')
const env       = require('../../env')

const clusterUrl = `mongodb+srv://${env.mongoose.username}:${env.mongoose.password}@${env.mongoose.host}/${env.mongoose.database}?retryWrites=true&w=majority`;

let mongoConn = mongoose.connect(clusterUrl, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => {
    console.log('MongoDB Atlas connected successfully');
    return true;
})
.catch((e) => {
    console.error('MongoDB connection error:', e);
    return false;
});

module.exports = mongoConn;