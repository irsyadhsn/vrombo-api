import { NextFunction, Request, Response } from "express"
import logging from "../config/logging"
import { Connect, Query } from "../config/mysql"

const NAMESPACE = "Courses"

// add course
const createCourse = async (
	req: Request,
	res: Response,
	next: NextFunction
) => {
	logging.info(NAMESPACE, "Adding course")

	let { courseName, courseCategory, courseModul } = req.body

	let query = `INSERT INTO course (courseName,courseCategory,courseModul) VALUES ( "${courseName}","${courseCategory}","${courseModul}")`

	Connect()
		.then((connection) => {
			Query(connection, query)
				.then((result) => {
					logging.info(NAMESPACE, "Course added : ", result)

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

// get courses
const getAllCourses = async (
	req: Request,
	res: Response,
	next: NextFunction
) => {
	logging.info(NAMESPACE, "Getting all courses")

	let query = "SELECT * FROM course"

	Connect()
		.then((connection) => {
			Query(connection, query)
				.then((results) => {
					logging.info(NAMESPACE, "Retrieved courses: ", results)

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

export default { getAllCourses, createCourse }
