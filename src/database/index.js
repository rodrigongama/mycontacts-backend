/* eslint-disable import/no-extraneous-dependencies */
const { Client } = require('pg');
require('dotenv').config();

const { DATABASE_URL, NODE_ENV } = process.env;
const sslConfig = NODE_ENV === 'production' ? { rejectUnauthorized: true } : false;

const client = new Client({
  connectionString: DATABASE_URL,
  ssl: sslConfig,
});

async function connectToDatabase() {
  try {
    await client.connect();
    console.log('Connected to the database');
  } catch (error) {
    console.error('Error connecting to the database:', error);
  }
}

connectToDatabase();

exports.query = async (query, values) => {
  const { rows } = await client.query(query, values);
  return rows;
};
