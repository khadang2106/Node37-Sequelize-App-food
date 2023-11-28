import express from 'express';
import { getUserLike, getUserRate } from '../controllers/userController.js';

const userRoute = express.Router();

userRoute.get('/get-user-like/:user_id', getUserLike);

userRoute.get('/get-user-rate/:user_id', getUserRate);

export default userRoute;
