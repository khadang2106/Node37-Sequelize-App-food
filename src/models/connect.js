import { Sequelize } from 'sequelize';
import config from '../config/config.js';

const { database, user, pass, host, port, dialect } = config;

const sequelize = new Sequelize(database, user, pass, {
  host,
  port,
  dialect,
});

export default sequelize;
