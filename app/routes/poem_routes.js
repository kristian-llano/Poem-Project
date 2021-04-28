const express = require('express')
const router = express.Router()
const Poem = require('../models/poem')
const handle404 = require('./../../lib/custom_errors')
const passport = require('passport')
const requireToken = passport.authenticate('bearer', {session: false})

router.post('/poems', requireToken, (req, res, next) => {
  req.body.poem.owner = req.user.id

  Poem.create(req.body.poem)
    .then(poem => {
      res.status(201).json({ poem: poem.toObject() })
    })
    .catch(next)
})

router.get('/poems/:id', (req, res, next) => {
  const id = req.params.id
  Poem.findById(id)
    .populate('owner')
    .then(handle404)
    .then(poem => res.json({poem}))
    .catch(next)
})

router.patch('/poems/:id', requireToken, (req, res, next) => {
  const id = req.params.id
  const poemData = req.body.poem
  Poem.findById(id)
    .then(handle404)
    .then(poem => poem.updateOne(poemData))
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.delete('/poems/:id', requireToken, (req, res, next) => {
  const id = req.params.id
  Poem.findById(id)
    .then(handle404)
    .then(poem => poem.deleteOne())
    .then(() => res.sendStatus(204))
    .catch(next)
})
// use requireToken
// only return the events that are owned by the user making the request (will need to use token)
// return events to client
// (dont forget curl script)

module.exports = router
