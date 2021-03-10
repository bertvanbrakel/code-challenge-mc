import * as express from 'express'
import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { handleCount } from './handleCount'

// init firebase
admin.initializeApp(functions.config().firebase)

console.log('API ready for requests')

const main = require('express')()

// define test endpoint for confirming connectivity
main.get('/', (_req: express.Request, res: express.Response) => {
  res.status(200).send('API GET ready')
})

main.post('/', (_req: express.Request, res: express.Response) => {
  res.status(200).send('API POST ready')
})

// hook in the api functions
main.post('/count', handleCount)

// define the app as a cloud funtion called api
export const api = functions.https.onRequest(main)
