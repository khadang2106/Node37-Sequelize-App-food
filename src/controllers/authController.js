import { responseData } from '../config/response.js';
import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import bcrypt from 'bcrypt';
import { createToken } from '../config/jwt.js';

let model = initModels(sequelize);

export const register = async (req, res) => {
  try {
    const { full_name, email, password } = req.body;

    const checkUser = await model.users.findOne({
      where: {
        email,
      },
    });

    if (checkUser) {
      responseData(res, 'Email existed!', '', 400);
      return;
    }

    const newUser = {
      full_name,
      email,
      password: bcrypt.hashSync(password, 10),
    };

    await model.users.create(newUser);

    responseData(res, 'Register Successfully', '', 200);
  } catch {
    responseData(res, 'Lỗi server', '', 500);
  }
};

export const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const checkUser = await model.users.findOne({
      where: {
        email,
      },
    });

    if (checkUser) {
      if (bcrypt.compareSync(password, checkUser.password)) {
        let token = createToken({ user_id: checkUser.user_id });

        responseData(res, 'Login Successfully', token, 200);
      } else {
        responseData(res, 'Incorrect Password', '', 400);
      }
    } else {
      responseData(res, 'Incorrect Email', '', 400);
    }
  } catch {
    responseData(res, 'Lỗi server', '', 500);
  }
};
