import express from 'express';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
app.use(express.json());

/**
 * @type {import('mysql2').PoolOptions}
 */
const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
};

console.log('connecting to database', dbConfig);


const pool = mysql.createPool(dbConfig);

app.get('/items', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM TestTable');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.get('/items/:id', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM TestTable WHERE ID = ?', [req.params.id]);
    if (rows.length === 0) {
      return res.status(404).json({ error: 'Item not found' });
    }
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.post('/items', async (req, res) => {
  try {
    const { ID, Name } = req.body;
    await pool.query('INSERT INTO TestTable (ID, Name) VALUES (?, ?)', [ID, Name]);
    res.status(201).json({ message: 'Item created' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.put('/items/:id', async (req, res) => {
  try {
    const { Name } = req.body;
    const [result] = await pool.query('UPDATE TestTable SET Name = ? WHERE ID = ?', [Name, req.params.id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Item not found' });
    }
    res.json({ message: 'Item updated' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.delete('/items/:id', async (req, res) => {
  try {
    const [result] = await pool.query('DELETE FROM TestTable WHERE ID = ?', [req.params.id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Item not found' });
    }
    res.json({ message: 'Item deleted' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
