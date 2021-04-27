const express = require('express')
const router = express.Router()
const Poem = require('./../models/poem')
const handle404 = require('./../../lib/custom_errors')
const passport = require('passport')
const requireToken = passport.authenticate('bearer', {session: false})
const removeBlanks = require('../../lib/remove_blank_fields')
const customErrors = require('../../lib/custom_errors')
const requireOwnership = customErrors.requireOwnership

router.post('/poems', requireToken, (req, res, next) => {
  req.body.poem.owner = req.user.id
  Poem.create(req.body.poem)
    .then(poem => {
      res.status(201).json({ poem: poem.toObject() })
    })
    .catch(next)
})

router.get('/poems', requireToken, (req, res, next) => {
  const id = req.user.id
  Poem.find({ owner: id })
    .then(poems => {
      return poems.map(poem => poem.toObject())
    })
    .then(poems => res.status(200).json({ poems }))
    .catch(next)
})

router.patch('/poems/:id', requireToken, removeBlanks, (req, res, next) => {
  delete req.body.poem.owner
  Poem.findById(req.params.id)
    .then(handle404)
    .then(poem => {
      requireOwnership(req, poem)
      return poem.updateOne(req.body.poem)
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.delete('/poems/:id', requireToken, (req, res, next) => {
  Poem.findById(req.params.id)
    .then(handle404)
    .then(poem => {
      requireOwnership(req, poem)
      poem.deleteOne()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})
// use requireToken
// only return the events that are owned by the user making the request (will need to use token)
// return events to client
// (dont forget curl script)

module.exports = router
