import { prisma } from "../common/prisma/connect.prisma.js";
import sequelize from "../common/sequelize/connect.sequelize.js";
import Article from "../models/article.model.js";

// 4 nơi nhận dữ liệu từ FE: body, header, query, params

export const articleService = {
    async findAll(req) {
        // sequelize
        // return "list article";
        // const resultSequelize = await Article.findAll();
        // return resultSequelize;
        let { page, pageSize } = req.query;
        const pageDefault = 1;
        const pageSizeDefault = 3;

        // chuyển đổi thành số
        page = Number(page);
        pageSize = Number(pageSize);

        // nếu gửi chữ
        page = Number(page || 1);
        pageSize = Number(pageSize || 3);

        // nếu số âm
        if (page < 1) page = 1;
        if (pageSize < 1) pageSize = 3;

        const index = (page - 1) * pageSize;

        const resultPrisma = await prisma.articles.findMany({
            where: {
                isDeleted: false,
            },
            skip: index, //Offset
            take: pageSize, //Limit
        });

        const totalItem = await prisma.articles.count({
            where: {
                isDeleted: false,
            },
        });

        const totalPage = Math.ceil(totalItem / pageSize);

        return {
            item: resultPrisma,
            totalItems: totalItem,
            totalPages: totalPage,
            page: page,
            pageSize: pageSize,
        };
    },

    async create(req) {
        const body = req.body;
        // console.log({ body });
        const result = await prisma.articles.create({
            data: {
                title: body.title,
                Content: body.content,
                userId: 1,
            },
        });
        return true;
    },

    // PARAMS: ID -> ĐỂ DETAIL, UPDATE, DELETE
    async update(req) {
        const body = req.body;
        const { articleID } = req.params;
        // console.log({ body, articleID });

        await prisma.articles.update({
            where: { id: Number(articleID) },
            data: {
                title: body.title,
                Content: body.content,
            },
        });
        return true;
    },

    async delete(req) {
        const { articleID } = req.params;
        // console.log({ articleID });

        // không sử dụng delete thật trong db
        // prisma.articles.delete({
        //     where: { id: Number(articleID) },
        // });

        await prisma.articles.update({
            where: { id: Number(articleID) },
            data: {
                isDeleted: true,
                deletedAt: new Date(),
                deletedBy: 1,
            },
        });

        return true;
    },
};
