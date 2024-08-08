import { NextFunction, Request, Response } from "express"
import bcryptjs from "bcryptjs"
import logging from "../config/logging"
import { Connect, Query } from "../config/mysql"
