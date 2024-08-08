import { NextFunction, Request, Response } from "express"
import logging from "../config/logging"
import { Connect, Query } from "../config/mysql"

const NAMESPACE = "Trainee"

// add trainee
const addTrainee = async (req: Request, res: Response, next: NextFunction) => {
	logging.info(NAMESPACE, "Adding trainee")

	let { name, role } = req.body

	let query = `INSERT INTO trainee (name,role) VALUES ( "${name}","${role}")`

	Connect()
		.then((connection) => {
			Query(connection, query)
				.then((result) => {
					logging.info(NAMESPACE, "Trainee added : ", result)

					return res.status(200).json({
						result,
					})
				})
				.catch((error) => {
					logging.error(NAMESPACE, error.message, error)

					return res.status(200).json({
						message: error.message,
						error,
					})
				})
				.finally(() => {
					logging.info(NAMESPACE, "Closing connection.")
					connection.end()
				})
		})
		.catch((error) => {
			logging.error(NAMESPACE, error.message, error)

			return res.status(200).json({
				message: error.message,
				error,
			})
		})
}

// get trainee
const getAllTrainee = async (
	req: Request,
	res: Response,
	next: NextFunction
) => {
	logging.info(NAMESPACE, "Getting all trainees")

	let query = "SELECT * FROM trainee"

	Connect()
		.then((connection) => {
			Query(connection, query)
				.then((results) => {
					logging.info(NAMESPACE, "Retrieved trainee: ", results)

					return res.status(200).json({
						results,
					})
				})
				.catch((error) => {
					logging.error(NAMESPACE, error.message, error)

					return res.status(200).json({
						message: error.message,
						error,
					})
				})
				.finally(() => {
					logging.info(NAMESPACE, "Closing connection.")
					connection.end()
				})
		})
		.catch((error) => {
			logging.error(NAMESPACE, error.message, error)

			return res.status(200).json({
				message: error.message,
				error,
			})
		})
}

export default { getAllTrainee, addTrainee }
