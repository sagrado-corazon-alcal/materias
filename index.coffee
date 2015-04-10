xls = require('xlsjs')
_ = require('lodash')

xlsPath = process.argv[2]
workbook = xls.readFile(xlsPath)

data = _.map workbook.Sheets, xls.utils.sheet_to_json

result =
  profes:
    _(data).flatten().map("Profesor").uniq().reject(_.isUndefined).reject((it) -> it == "SIN PROFE").sort()

  materiasPorAnio:
    _(data).map (materias, anio) ->
      curso: workbook.SheetNames[anio]
      materias: _(materias).map("Materia").compact().value()

writeJson = _.partial require("fs").writeFile, "output.json"

[writeJson, console.log].forEach (write) -> write (JSON.stringify result)