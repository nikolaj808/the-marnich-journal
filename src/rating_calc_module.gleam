import models/record
import models/entry
import models/user

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

  // Assign points based on the position of each user
  List.indexed_map(users, fn(index, user) {
    case index {
      0 -> Tuple(user, min(4, n))   // 1st user gets max 4 points
      1 -> Tuple(user, min(3, n - 1)) // 2nd user gets max 3 points
      2 -> Tuple(user, min(2, n - 2)) // 3rd user gets max 2 points
      3 -> Tuple(user, min(1, n - 3)) // 4th user gets max 1 point
      _ -> Tuple(user, 0)             // All other users get 0 points
    }
  })
}

// pub fn convert_leaderboard(records: List(record.Record)) -> List(user.User){
//   records
//   |> List.map(fn(record) {
      
//   })

//   })
// }