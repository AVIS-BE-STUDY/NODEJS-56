import { statusCodes } from "./statusCode.helper.js";

export const responseSuccess = (
    result,
    statusCode = statusCodes.OK,
    message = "Lấy danh sách thành công",
) => {
    return {
        status: "success",
        statusCode: statusCode,
        message: message,
        data: result,
        doc: "swagger.com",
    };
};

export const responseError = (
    stack,
    message = "Internal server error",
    statusCode = statusCodes.INTERNAL_SERVER_ERROR,
) => {
    return {
        status: "error",
        statusCode: statusCode,
        stack: stack, //Chỉ hiển thị ở môi trường dev
        doc: "swagger.com",
    };
};
