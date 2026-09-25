import { responseSuccess } from "../helpers/response.helper.js";
import { statusCodes } from "../helpers/statusCode.helper.js";
import { articleService } from "../services/article.service.js";

export const articleController = {
    async findAll(req, res) {
        // điều hướng về service để xử lý nghiệp vụ
        const result = await articleService.findAll(req);

        // trả dữ liệu cho client
        const response = responseSuccess(result);
        res.status(response.statusCode).json(response);
    },

    async create(req, res) {
        const result = await articleService.create(req);
        const response = responseSuccess(
            result,
            statusCodes.CREATED,
            "Tạo bài viết thành công",
        );
        res.status(response.statusCode).json(response);
    },

    async update(req, res) {
        const result = await articleService.update(req);
        const response = responseSuccess(
            result,
            statusCodes.CREATED,
            "Cập nhật bài viết thành công",
        );
        res.status(response.statusCode).json(response);
    },

    async delete(req, res) {
        const result = await articleService.delete(req);
        const response = responseSuccess(
            result,
            statusCodes.CREATED,
            "Xóa bài viết thành công",
        );
        res.status(response.statusCode).json(response);
    },
};
