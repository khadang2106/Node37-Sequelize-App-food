import express from 'express';
import resRoute from './resRoutes.js';
import userRoute from './userRoutes.js';

const rootRoute = express.Router();

rootRoute.use('/res', resRoute);

rootRoute.use('/user', userRoute);

export default rootRoute;
