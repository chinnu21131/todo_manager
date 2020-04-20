class Todo < ApplicationRecord
  belongs_to :user

  def due_today
    due_date == Date.today
  end

  def self.overdue
    all.where("due_date < ? and completed=?", Date.today, false)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue"
    puts Todo.where("due_date < ?", Date.today).to_displayable_list
    puts "\n\n"

    puts "Due Today"
    puts Todo.where("due_date = ?", Date.today).to_displayable_list
    puts "\n\n"

    puts "Due Later"
    puts Todo.where("due_date > ?", Date.today).to_displayable_list
    puts "\n\n"
  end

  #def self.add_task(task)
  #  Todo.create!(todo_text: task[:todo_text], due_date: Date.today + task[:due_in_days], completed: false)
  #end

  def self.mark_as_complete!(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    return todo
  end
end
