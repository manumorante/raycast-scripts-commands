#!/usr/bin/env node

// @raycast.schemaVersion 1
// @raycast.title Tokens Parser
// @raycast.mode fullOutput
// @raycast.packageName Manu Scripts
// @raycast.icon ⚙️

const PROJECTS_PATH = '/Users/manu/projects'
const SCRIPTS_PATH = PROJECTS_PATH + '/dotfiles/raycast/scripts'
const FILE_IN = PROJECTS_PATH + '/frontend/packages/styles/src/grid/base.css'
const FILE_OUT = SCRIPTS_PATH + '/tokens.json'

const fs = require('fs')
const data = fs.readFileSync(FILE_IN, {encoding:'utf8', flag:'r'});

let fileJSON = ''
let types = []
let total = 0

data.split('\n').forEach(line => {
  if (line.includes('{ ')) {
    total += 1
    line = line.replace(/^\./, '')
    line = line.replace(/\\/g, '')
    line = line.replace('{ ', '')
    line = line.replace(' }', '')

    let title = line.split(' ')[0]
    let subtitle = line.split(' ').slice(1).join(' ')
    let accessory = subtitle.split(':')[0]

    subtitle = subtitle.replace(/\"/g, '\'')
    subtitle = subtitle.replace(/;$/, '')

    fileJSON = fileJSON + `{
      "id": "${total}::${accessory}",
      "title": "${title}",
      "subtitle": "${subtitle}",
      "accessory": "${accessory}"\r
    },`

    // Insertar element al array de tipos
    if (!types.includes(accessory)) {
      types.push(accessory)
    }
  }
})

fileJSON = `{
  "items": [
    ${fileJSON}
    { "title": "end" }
  ]
}`

fs.writeFileSync(FILE_OUT, fileJSON, {encoding:'utf8', flag:'w'});


console.log(types)
