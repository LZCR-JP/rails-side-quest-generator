require "json"

puts "Creating sample quests..."

[
  {
    title: "Build a tiny command-line tool",
    description: "Write a program that converts temperatures, counts words, or formats a name.",
    category: "Coding",
    difficulty: "easy",
    duration_minutes: 30
  },
  {
    title: "Explain one error message",
    description: "Pick an error from a project, find its cause, and write down how you fixed it.",
    category: "Debugging",
    difficulty: "easy",
    duration_minutes: 20
  },
  {
    title: "Recreate a simple webpage",
    description: "Choose a small part of a website, such as a profile card, and build it with HTML and CSS.",
    category: "Frontend",
    difficulty: "medium",
    duration_minutes: 45
  },
  {
    title: "Add one feature to your Rails app",
    description: "Pick a small improvement, build it, and commit your changes.",
    category: "Rails",
    difficulty: "medium",
    duration_minutes: 60
  },
  {
    title: "Read unfamiliar code",
    description: "Explore a small open-source project and trace what happens when one feature runs.",
    category: "Code reading",
    difficulty: "hard",
    duration_minutes: 45
  }
].each do |attributes|
  Quest.find_or_create_by!(title: attributes[:title]) do |quest|
    quest.assign_attributes(attributes)
  end
end

puts "Importing MBPP quests..."

file = Rails.root.join("db", "mbpp.jsonl")

unless File.exist?(file)
  raise "Could not find db/mbpp.jsonl. Download the MBPP dataset file first."
end

File.foreach(file) do |line|
  task = JSON.parse(line)
  title = "Python challenge #{task["task_id"]}: #{task["text"].truncate(55)}"

  Quest.find_or_create_by!(title: title) do |quest|
    quest.description = task["text"]
    quest.category = "Python"
    quest.difficulty = "easy"
    quest.duration_minutes = 15
  end
end

puts "Finished! There are now #{Quest.count} quests."