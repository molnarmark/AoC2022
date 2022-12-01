const fs = require('fs');
const data = fs.readFileSync('input.txt').toString().split('\n');

function chunkify(data) {
  const chunks = [];

  let i = 0;
  for (const line of data) {
    if (line === '') {
      i++;
      continue;
    }

    chunks[i] = !chunks[i] ? {index: i, value: parseInt(line, 10)} : {index: i, value: chunks[i].value + parseInt(line, 10)};
  }

  return chunks.sort((a, b) => b.value - a.value);
}

console.log(chunkify(data).shift().value);