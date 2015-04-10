var xls = require("xlsjs");
var _ = require("lodash");

var xlsPath = process.argv[2];
var workbook = xls.readFile(xlsPath);

console.log(workbook.SheetNames);