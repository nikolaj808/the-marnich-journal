import models/entry
import models/user


pub type Record {
  Record(
    entries: List(entry.Entry),
    user: user.User,
    approves: Int,
    date: String
  )
}