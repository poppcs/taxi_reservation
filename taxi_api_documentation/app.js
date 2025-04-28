
// app.js
const express = require('express');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');


const swaggerDocument = YAML.load('./swagger.yaml');

const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('taxi api documentation');
});

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});