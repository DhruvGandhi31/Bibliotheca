const mongoose = require('mongoose');

mongoose.connect('mongodb+srv://dhruvvgandhi3110:dvg3110@cluster0.rkmpmgg.mongodb.net/Library_management?retryWrites=true&w=majority', {
    useNewUrlParser: true,
    // useUnifiedTopology: true,
});

mongoose.connection.on('error', (err) => {
    console.error(`MongoDB connection error: ${err}`);
    process.exit(-1);
});

mongoose.connection.once('open', () => {
    console.log('Connected to MongoDB');
});

module.exports = mongoose.connection;
