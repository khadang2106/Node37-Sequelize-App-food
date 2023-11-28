import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import { responseData } from '../config/response.js';
import moment from 'moment/moment.js';
import { generateArrSubId } from '../config/common.js';

let model = initModels(sequelize);

export const getResLike = async (req, res) => {
  try {
    const { res_id } = req.params;

    const data = await model.like_res.findAll({
      where: {
        res_id,
      },
      include: [
        {
          model: model.users,
          as: 'user',
          attributes: ['user_id', 'full_name'],
        },
        're',
      ],
    });

    responseData(res, 'Get Data Successfully', data, 200);
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};

export const likeRes = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;

    const isExist = await model.like_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    if (isExist) {
      await isExist.destroy();

      responseData(res, 'Unlike Successfully', '', 200);
    } else {
      const formattedDate = moment().format('YYYY-MM-DD HH:mm:ss');

      const newData = {
        user_id,
        res_id,
        date_like: formattedDate,
      };

      await model.like_res.create(newData);

      responseData(res, 'Like Successfully', '', 200);
    }
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};

export const getResRate = async (req, res) => {
  try {
    const { res_id } = req.params;

    const data = await model.rate_res.findAll({
      where: {
        res_id,
      },
      include: [
        {
          model: model.users,
          as: 'user',
          attributes: ['user_id', 'full_name'],
        },
        're',
      ],
    });

    responseData(res, 'Get Data Successfully', data, 200);
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};

export const rateRes = async (req, res) => {
  try {
    const { user_id, res_id, amount } = req.body;

    const formattedDate = moment().format('YYYY-MM-DD HH:mm:ss');

    const newData = {
      user_id,
      res_id,
      amount,
      date_rate: formattedDate,
    };

    await model.rate_res.create(newData);

    responseData(res, 'Rate Successfully', newData, 200);
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};

export const makeOrder = async (req, res) => {
  try {
    const { user_id, food_id, amount } = req.body;

    const arr_sub_id = generateArrSubId();

    const newData = {
      user_id,
      food_id,
      amount,
      code: req.body.code ? req.body.code : null,
      arr_sub_id,
    };

    await model.orders.create(newData);

    const orderDetail = await model.orders.findOne({
      where: { user_id, food_id },
      include: [
        {
          model: model.users,
          as: 'user',
          attributes: ['user_id', 'full_name'],
        },
        {
          model: model.food,
          as: 'food',
          attributes: ['food_id', 'food_name', 'image'],
        },
      ],
    });

    responseData(res, 'Order Successfully', orderDetail, 200);
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};
