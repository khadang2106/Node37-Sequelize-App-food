import express from 'express';
import {
  getResLike,
  getResRate,
  likeRes,
  makeOrder,
  rateRes,
} from '../controllers/resController.js';

const resRoute = express.Router();

resRoute.get('/get-res-like/:res_id', getResLike);

resRoute.get('/get-res-rate/:res_id', getResRate);

resRoute.post('/rate-res', rateRes);

resRoute.post('/like', likeRes);

resRoute.post('/order', makeOrder);

export default resRoute;
