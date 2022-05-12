#!/usr/bin/env node

// @raycast.schemaVersion 1
// @raycast.title Tokens
// @raycast.mode fullOutput
// @raycast.packageName Design System
// @raycast.icon images/domestika.png

const FILE_PATH = '/Users/manu/projects/frontend/packages/styles/src/grid/base.css'

const fs = require('fs').promises;
async function getFile(file_path) {
  const data = await fs.readFile(file_path, "binary")
  return new Buffer.from(data).toString()
}

getFile(FILE_PATH).then(data => {
  utilities = data.split('\n')

  console.log('Filtrar .')
  console.log(utilities.filter(line => line.includes('.')))
  
  console.log('Filtrar .fz')
  console.log(utilities.filter(line => line.includes('.tr')))
})
