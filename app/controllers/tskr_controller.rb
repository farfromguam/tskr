class TskrController

  def initialize params
    @params = params
  end

  def query_category
    Category.where( name: @params[:category] ).first
  end

  def add_category
    category = Category.create( name: @params[:category_name], priority: @params[:priority], due_date: @params[:due_date] )
    if category.save
      puts "New Category #{@params[:category_name]} added"
    else
      puts "Failure. Category not added"
    end
  end

  def remove_category
    Category.where( name: @params[:category_name] ).first.destroy
  end

  def add_task

    category = query_category
    if category.nil?
      Category.create( name: @params[:category] )
    end

    task = Task.create( name: @params[:task_name], category: query_category, priority: @params[:priority], due_date: @params[:due_date] )
    if task.save
      puts "New task \"#{@params[:task_name]}\" added"
    else
      puts "Failure, Task not added"
    end

  end

  def remove_task
      Task.where( id: @params[:id] ).first.destroy
  end

  def mark_task
    target_task = Task.find_by_id(@params[:id])
    target_task.complete = true
    target_task.save
  end

  def unmark_task
    target_task = Task.find_by_id(@params[:id])
    target_task.complete = false
    target_task.save
  end

  def assemble_tasks
    Task.all
  end

  def list
    sub_header = "All your things"

    #these calculate stuff for the header, its ugly but it works
    task_width = 45
    column_width = 10
    spaces_id_column = Task.last.id.to_s.length
    spaces_x_column = 5
    spaces_before_sub_header = spaces_x_column + spaces_id_column
    left_padding = " " * spaces_before_sub_header
    sub_header_ljust = spaces_before_sub_header + task_width - 19
    hr_length = spaces_before_sub_header + task_width + 3 + column_width + 3 + column_width + 3 + column_width + 2
    hr = "-" * hr_length

    banner = <<-eos
___ ____ _  _ ____
 |  [__  |_/  |__/
 |  ___] | \\_ |  \\ #{sub_header.ljust(sub_header_ljust, " ")} | #{"Category".ljust(column_width, " ")} | #{"Priority".ljust(column_width, " ")} | #{"Due Date".ljust(column_width, " ")} |
#{hr}
eos

    print "\e[H\e[2J"
    print banner
    tasks = assemble_tasks
    tasks.each_with_index do |task, i|

      id = task.id.to_s.rjust(spaces_id_column, " ")
      if task.complete? then check = "x" else check = " " end
      task_name = task.name.ljust(task_width, " ")
      category = task.category.name.to_s.ljust(column_width, " ")
      priority = task.priority.to_s.ljust(column_width, " ")
      due_date = task.due_date.to_s.ljust(column_width, " ")

      print "#{id} [#{check}] #{task_name} | #{category} | #{priority} | #{due_date} |\n"
    end

  end


end