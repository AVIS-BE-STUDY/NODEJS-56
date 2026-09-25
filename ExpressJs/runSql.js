import mysql from "mysql2/promise";
import fs from "fs";

async function main() {
    try {
        const sql = fs.readFileSync("../nodejs56.sql", "utf8");

        const connection = await mysql.createConnection({
            host: "localhost",
            port: 3307,
            user: "root",
            password: "12345",
            multipleStatements: true, // ⚠️ THÊM DÒNG NÀY — bị thiếu ở bước trước
        });

        await connection.query(`CREATE DATABASE IF NOT EXISTS nodejs56`);
        await connection.query(`USE nodejs56`);
        await connection.query(sql);

        console.log("✅ Đã chạy file SQL thành công — database đã được tạo!");
        await connection.end();
    } catch (err) {
        console.error("❌ Lỗi:", err.message);
    }
}

main();
