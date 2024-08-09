import dotenv from "dotenv"

dotenv.config()

const DB_HOST = process.env.DB_HOST
const DB_NAME = process.env.DB_NAME
const DB_USERNAME = process.env.DB_USERNAME
const DB_PASSWORD = process.env.DB_PASSWORD

const MYSQL = {
	host: DB_HOST,
	database: DB_NAME,
	user: DB_USERNAME,
	password: DB_PASSWORD,
}

const APP_HOSTNAME = process.env.APP_HOSTNAME
const APP_PORT = process.env.APP_PORT
const APP_TOKEN_EXPIRETIME = process.env.APP_TOKEN_EXPIRETIME || 7200
const APP_TOKEN_ISSUER = process.env.APP_TOKEN_ISSUER || "vromboissuer"
const APP_TOKEN_SECRET = process.env.APP_TOKEN_SECRET || "vrombosecret"

const SERVER = {
	hostname: APP_HOSTNAME,
	port: APP_PORT,
	token: {
		expireTime: APP_TOKEN_EXPIRETIME,
		issuer: APP_TOKEN_ISSUER,
		secret: APP_TOKEN_SECRET,
	},
}

const config = {
	mysql: MYSQL,
	server: SERVER,
}

export default config
