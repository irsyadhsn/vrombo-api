export default interface IMySQLResult {
	fieldCount: number
	affectedRows: number
	insertId: number
	serverStatus: number
	warningCount: number
	message: string
	protocol41: boolean
	changedRows: number
}
