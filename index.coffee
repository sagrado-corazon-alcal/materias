xls = require('xlsjs')
_ = require('lodash')

xlsPath = process.argv[2]
workbook = xls.readFile(xlsPath)

console.log _.map(workbook.Sheets, xls.utils.sheet_to_json)