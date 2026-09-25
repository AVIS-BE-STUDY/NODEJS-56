import { PrismaMariaDb } from "@prisma/adapter-mariadb";
import { PrismaClient } from "./generated/prisma/client.js";
import { DATABASE_URL } from "../constants/app.constants.js";

const url = new URL(DATABASE_URL);

console.log(url);
const adapter = new PrismaMariaDb({
    host: url.hostname,
    user: url.username,
    password: url.password,
    database: url.pathname.slice(1),
    port: url.port,
});

const prisma = new PrismaClient({ adapter });

// kiểm tra kết nối
try {
    await prisma.$queryRaw`SELECT 1 + 1 AS result`;
    console.log("✅ [PRISMA] Connection has been established successfully.");
} catch (error) {
    console.error("❌ [SEQUELIZE]  Unable to connect to the database:", error);
}

export { prisma };
