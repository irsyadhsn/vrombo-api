import express from "express"
import controller from "../controllers/course.controller"

const router = express.Router()

router.get("/get/courses", controller.getAllCourses)
router.post("/post/course", controller.createCourse)

export = router
