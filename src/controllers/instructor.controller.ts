import { NextFunction, Request, Response } from "express"
import bcryptjs from "bcryptjs"
import logging from "../config/logging"
import { Connect, Query } from "../config/mysql"
import IMySQLResult from "../model/result"
import Instructor from "../model/Instructor"
import signJWT from "../function/instructor-signJWT"

const NAMESPACE = "Admin"

const validateToken = (req: Request, res: Response, next: NextFunction) => {
	logging.info(NAMESPACE, "Token validated, user authorized.")

	return res.status(200).json({
		message: "Token(s) validated",
	})
}

const register = (req: Request, res: Response, next: NextFunction) => {
	let { name, password } = req.body

	bcryptjs.hash(password, 10, (hashError, hash) => {
		if (hashError) {
			return res.status(401).json({
				message: hashError.message,
				error: hashError,
			})
		}

		let query = `INSERT INTO instructor (name, password, role) VALUES ("${name}", "${hash}", "instructor")`

		Connect()
			.then((connection) => {
				Query<IMySQLResult>(connection, query)
					.then((result) => {
						logging.info(NAMESPACE, `User with id ${result.insertId} inserted.`)

						return res.status(201).json(result)
					})
					.catch((error) => {
						logging.error(NAMESPACE, error.message, error)

						return res.status(500).json({
							message: error.message,
							error,
						})
					})
			})
			.catch((error) => {
				logging.error(NAMESPACE, error.message, error)

				return res.status(500).json({
					message: error.message,
					error,
				})
			})
	})
}

const login = (req: Request, res: Response, next: NextFunction) => {
	let { name, password } = req.body

	let query = `SELECT * FROM instructor WHERE name = '${name}'`

	Connect()
		.then((connection) => {
			Query<Instructor[]>(connection, query)
				.then((users) => {
					bcryptjs.compare(password, users[0].password, (error, result) => {
						if (error) {
							return res.status(401).json({
								message: "Password Mismatch",
							})
						} else if (result) {
							signJWT(users[0], (_error, token) => {
								if (_error) {
									return res.status(401).json({
										message: "Unable to Sign JWT",
										error: _error,
									})
								} else if (token) {
									return res.status(200).json({
										message: "Auth Successful",
										token,
										user: users[0],
									})
								}
							})
						}
					})
				})
				.catch((error) => {
					logging.error(NAMESPACE, error.message, error)

					return res.status(500).json({
						message: error.message,
						error,
					})
				})
		})
		.catch((error) => {
			logging.error(NAMESPACE, error.message, error)

			return res.status(500).json({
				message: error.message,
				error,
			})
		})
}

const getAllInstructor = (req: Request, res: Response, next: NextFunction) => {
	let query = `SELECT instructorId, name FROM instructor`

	Connect()
		.then((connection) => {
			Query<Instructor[]>(connection, query)
				.then((users) => {
					return res.status(200).json({
						users,
						count: users.length,
					})
				})
				.catch((error) => {
					logging.error(NAMESPACE, error.message, error)

					return res.status(500).json({
						message: error.message,
						error,
					})
				})
		})
		.catch((error) => {
			logging.error(NAMESPACE, error.message, error)

			return res.status(500).json({
				message: error.message,
				error,
			})
		})
}

export default { validateToken, register, login, getAllInstructor }
