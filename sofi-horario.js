#!/usr/bin/env node

// @raycast.schemaVersion 1
// @raycast.title Sofia
// @raycast.mode fullOutput
// @raycast.packageName Manu Scripts
// @raycast.icon 🌸

const fs = require('fs')
const pdf = require('pdf-parse') // https://gitlab.com/autokent/pdf-parse

// const FILE_PATH = '/Users/manu/Downloads/hamman.pdf'
const FILE_PATH = '/Users/manu/Library/Mobile Documents/com~apple~CloudDocs/Horario.pdf'
let dataBuffer = fs.readFileSync(FILE_PATH)

// Configuración

/* * * * * * * * * * * * * * * * *
  Turno   Lunes       Martes
  10:00   (A) Maria   (AE) Juan
          (M) Sofia   (AE) Pepe
          TMMD        TMMD
  12:00   (M) Pepe    (AE) Sofia
          (M) Sofia   (AE) Maria
          TMMD        TMMD
* * * * * * * * * * * * * * * * * */

const PERSON      = 'Sofia'
const TURNS       = ['10:00', '12:00', '14:00', '16:00', '18:00', '20:00', '22:00', '24:00', '01:00', '02:00']
const DAYS_NAME   = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
const DAY_BREAK   = 'TMMD'

/**
 * TODO
 * [X] Get and show rol (A, M, AE, ...)
 * [ ] Green color for Free day
 * [ ] Color for tables
 * 
 * TESTS:
 * [ ] Error file not found
 * [ ] File not pdf
 * [ ] File PDF but no text
 * [ ] Text not split string
 */

let dataJSON = [[], [], [], [], [], [], []]

pdf(dataBuffer).then(function(data) {
	let turns_row = data.text.split(':00')
  let rol = ''

  turns_row.forEach((turn, turnID) => {
    days = turn.split(DAY_BREAK)

    days.forEach((day, dayID) => {
      if(day.includes(PERSON)){
        day.split('\n').forEach((line) => {
          if(line.includes(PERSON)) {            
            rol = line.substring(1, line.indexOf(')'))
          }
        })
        dataJSON[dayID].push([turnID, rol])
      }
    })
  })

  console.log(dataJSON)

  dataJSON.forEach((day, dayID) => {
    let space = '     '
    let out = ''
    let dayName = DAYS_NAME[dayID] + '     '
    out = dayName.substring(0, 10)
    
    if(day.length) {
      let rol = `(${day[0][1]}) `
      let turnStart = day[0][0] - 1
      let turnEnd   = day[day.length-1][0]

      rol = rol.substring(0, 4)

      out += `${space}${TURNS[turnStart]} ${rol}`
      out += `${space}${TURNS[turnEnd]} ${rol}`
      out += `${space}${day.length * 2} horas`
    } else {
      out += 'LIBRE'
    }

    console.log(out)
  })
})
