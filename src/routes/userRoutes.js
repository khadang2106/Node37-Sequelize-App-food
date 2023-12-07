import express from 'express';
import { getUserLike, getUserRate } from '../controllers/userController.js';

const userRoute = express.Router();

userRoute.get('/get-user-like', getUserLike);

userRoute.get('/get-user-rate', getUserRate);

export default userRoute;
