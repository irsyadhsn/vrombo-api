import jwt from "jsonwebtoken"
import config from "../config/config"
import logging from "../config/logging"
import Instructor from "../model/Instructor"

const NAMESPACE = "Auth MasterAdmin"

const signJWT = (
	user: Instructor,
	callback: (error: Error | null, token: string | null) => void
): void => {
	var timeSinceEpoch = new Date().getTime()
	var expirationTime =
		timeSinceEpoch + Number(config.server.token.expireTime) * 100000
	var expirationTimeInSeconds = Math.floor(expirationTime / 1000)

	logging.info(NAMESPACE, `Attempting to sign token for ${user.instructorId}`)

	try {
		jwt.sign(
			{
				username: user.name,
			},
			config.server.token.secret,
			{
				issuer: config.server.token.issuer,
				algorithm: "HS256",
				expiresIn: expirationTimeInSeconds,
			},
			(error, token) => {
				if (error) {
					callback(error, null)
				} else if (token) {
					callback(null, token)
				}
			}
		)
	} catch (error) {
		logging.error(NAMESPACE, error.message, error)
		callback(error, null)
	}
}

export default signJWT
