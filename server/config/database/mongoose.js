const mongoose = require('mongoose');
const env = require('../env');

const clusterUrl = `mongodb+srv://${env.mongoose.username}:${env.mongoose.password}@${env.mongoose.host}/${env.mongoose.database}?retryWrites=true&w=majority`;

const mongoConn = mongoose.connect(clusterUrl, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    autoIndex: true, // Keeps automatic index creation
})
.then(() => {
    console.log('✅ MongoDB Atlas connected successfully');
    return true;
})
.catch((e) => {
    console.error('❌ MongoDB connection error:', e);
    return false;
});

module.exports = mongoConn;
