import gleam/list
import gleam/int
import lustre
import lustre/element
import lustre/element/html
import lustre/event
import models/record
import models/entry
import models/user




pub type Model =
  Int

fn init(_flags) -> Model {
  0
}

pub type Msg {
  Increment
  Decrement
}

pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Increment -> model + convert_leaderboard(1,2)
    Decrement -> model - 1
  }
}

pub fn view(model: Model) -> element.Element(Msg) {
  let count = int.to_string(model)

  html.div([], [
    html.button([event.on_click(Increment)], [element.text("+")]),
    element.text(count),
    html.button([event.on_click(Decrement)], [element.text("-")]),
  ])
}

pub fn main() {
  let entry1 = entry.Entry(
    combatant: "Alice",
    submitter: "Bob",
    date: "2024-11-29",
    result: 100,
    description: "Match 1"
  )
  
  let entry2 = entry.Entry(
    combatant: "Charlie",
    submitter: "Dave",
    date: "2024-11-30",
    result: 200,
    description: "Match 2"
  )
  
  let record1 = record.Record(entry: entry1, approves: 10, date: "2024-11-29")
  let record2 = record.Record(entry: entry2, approves: 5, date: "2024-11-30")

  let leaderboard = convert_leaderboard([record1, record2])


  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn compare_entries(entry1: entry.Entry, entry2: entry.Entry) -> Int {
  case entry1.result > entry2.result {
    True -> 1  
    False -> case entry1.result == entry2.result {
      True -> 0
      False -> -1
    }
  }
}

pub fn sort_entries_by_result(entries: List(entry.Entry)) -> List(entry.Entry) {
  list.sort(entries, compare_entries)
}

pub fn get_sorted_users(submitted_record: record.Record){
  let sorted_entries = sort_entries_by_result(submitted_record.entries)
      List.map(sorted_entries, fn(entry) {
        entry.combatant
      })
}

pub fn score_users(users: List(user.User)) -> List(Tuple(user.User, Int)) {
  let n = List.length(users)

  List.indexed_map(users, fn(index, user) {
    let score = n - index
    Tuple(user, score)
  })
}

pub fn convert_leaderboard(records: List(record.Record)) -> List(user.User){
  records
  |> List.map(fn(record) {
      
  })

  })
}
