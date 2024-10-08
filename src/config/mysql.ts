import mysql from "mysql2"
import config from "./config"

const params = {
	host: config.mysql.host,
	user: config.mysql.user,
	password: config.mysql.password,
	database: config.mysql.database,
}

const Connect = async () =>
	new Promise<mysql.Connection>((resolve, reject) => {
		const connection = mysql.createConnection(params)

		connection.connect((error) => {
			if (error) {
				reject(error)
				return
			}

			resolve(connection)
		})
	})

const Query = async <T>(connection: mysql.Connection, query: string) =>
	new Promise<T>((resolve, reject) => {
		connection.query(query, connection, (error, result) => {
			if (error) {
				reject(error)
				return
			}
			resolve(result as T)

			connection.end()
		})
	})
export { Connect, Query }
