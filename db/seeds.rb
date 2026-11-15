puts "Cleaning database..."
Quest.destroy_all

puts "Creating Quests..."
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

puts "Finished! Created #{Quest.count} quests."
