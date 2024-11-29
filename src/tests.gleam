  
  
  pub fn run_test(){

  
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
  }