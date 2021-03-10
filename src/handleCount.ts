import * as express from 'express'

export type CountMsg = {
  words: string[]
  char: string
}
export function handleCount(req: express.Request, res: express.Response) {
  const msg = req.body as CountMsg
  var charCount = 0
  for (var word of msg.words) {
    for (var c of word) {
      if (c == msg.char) {
        charCount++
      }
    }
  }
  res.contentType('text').status(200).send(`${charCount}`)
}
