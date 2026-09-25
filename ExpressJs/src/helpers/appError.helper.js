import { responseError } from "./response.helper.js";

export const appError = (err, req, res, next) => {
    const response = responseError(err?.stack, err?.message, err?.code);
    res.status(response.statusCode).json(response)
};
