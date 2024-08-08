import express from "express"
import controller from "../controllers/trainee.controller"

const router = express.Router()

router.get("/get/trainees", controller.getAllTrainee)
router.post("/post/trainee", controller.addTrainee)

export = router
