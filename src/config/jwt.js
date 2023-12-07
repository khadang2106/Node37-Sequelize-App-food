import jwt from 'jsonwebtoken';

export const createToken = (data) =>
  jwt.sign({ data }, 'SECRET', { algorithm: 'HS256' });

export const decodeToken = (token) => jwt.decode(token);
