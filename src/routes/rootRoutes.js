import express from 'express';
import resRoute from './resRoutes.js';
import userRoute from './userRoutes.js';
import authRoute from './authRoutes.js';

const rootRoute = express.Router();

rootRoute.use('/res', resRoute);

rootRoute.use('/user', userRoute);

rootRoute.use('/auth', authRoute);

export default rootRoute;
