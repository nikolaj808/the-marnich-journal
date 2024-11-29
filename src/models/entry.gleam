import models/user

pub type Entry {
  Entry(
    combatant: user.User,
    submitter: user.User,
    date: String,
    result: Float,
    description: String
  )
}