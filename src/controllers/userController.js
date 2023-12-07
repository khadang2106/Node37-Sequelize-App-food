import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import { responseData } from '../config/response.js';
import { decodeToken } from '../config/jwt.js';

let model = initModels(sequelize);

export const getUserLike = async (req, res) => {
  try {
    const { token } = req.headers;
    const dToken = decodeToken(token);
    const { user_id } = dToken.data;

    const data = await model.like_res.findAll({
      where: {
        user_id,
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

    if (data.length === 0) {
      responseData(res, 'No data', '', 200);

      return;
    }

    responseData(res, 'Get Data Successfully', data, 200);
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};

export const getUserRate = async (req, res) => {
  try {
    const { token } = req.headers;
    const dToken = decodeToken(token);
    const { user_id } = dToken.data;

    const data = await model.rate_res.findAll({
      where: {
        user_id,
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

    if (data.length === 0) {
      responseData(res, 'No data', '', 200);

      return;
    }

    responseData(res, 'Get Data Successfully', data, 200);
  } catch {
    responseData(res, 'Lỗi server...', '', 500);
  }
};
