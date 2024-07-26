const express = require('express');
const router = express.Router()

const materialAlatUpahRoutes = require('./materialAlatUpah.routes');

router.use('/material-alat-dan-upah', materialAlatUpahRoutes);

router.get('/', (req, res) => {
  res.status(200).send('Api is running!');
});

module.exports = router;