require 'pry'

X_B = {
  ["B", "s1"] => ["X", "R", "s2"],
  ["B", "s2"] => ["B", "L", "s3"],
  ["X", "s3"] => ["B", "R", "s4"],
  ["B", "s4"] => ["B", "L", "s1"]
}

def simulate(instructions)
  tape = ["B", "B"] # real tape would grow infintely
  head = 0
  state = "s1"

  (1..8).each do
    puts tape.join("")
    puts " " * head + "^"

    key = [tape[head], state]
    tape_sym, head_dir, new_state = instructions[key]
    tape[head] = tape_sym
    head_dir == "R" ? head += 1 : head -= 1
    state = new_state
  end
end

simulate(X_B)
