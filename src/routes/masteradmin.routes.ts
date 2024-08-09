import express from "express"
import controller from "../controllers/masteradmin.controller"

const router = express.Router()

router.get("/validate", controller.validateToken)
router.post("/register", controller.register)
router.post("/login", controller.login)
router.get("/get/all", controller.getAllAdmins)

export = router
