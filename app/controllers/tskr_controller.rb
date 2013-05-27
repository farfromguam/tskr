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

  def parse_render_options
    render_option = @params[:option]

    if render_option == ""
      @tasks_for_render = Task.where( complete: false ).all
      @sub_header = "fun things to do"
    elsif render_option == "complete"
      @tasks_for_render = Task.where( complete: true ).all
      @sub_header = "the done stuff"
    elsif render_option == "all"
      @tasks_for_render = Task.all
      @sub_header = "all the things"
    else
      category = Category.where( name: render_option ).first
      @tasks_for_render = Task.where( :category_id => category ).all
      @sub_header = "just the #{render_option} things"
    end
  end

  def render
    parse_render_options

        task_width = 35
    category_width = 15
    priority_width = 10
    due_date_width = 10

    #these calculate spacing for the header, its ugly but it works
    spaces_id_column = Task.last.id.to_s.length
    spaces_x_column = 5
    spaces_before_sub_header = spaces_x_column + spaces_id_column
    left_padding = " " * spaces_before_sub_header
    sub_header_ljust = spaces_before_sub_header + task_width - 19
    hr_length = spaces_before_sub_header + task_width + 3 + category_width + 3 + priority_width + 3 + due_date_width + 2
    hr = "=" * hr_length

    header = <<-eos
___ ____ _  _ ____
 |  [__  |_/  |__/
 |  ___] | \\_ |  \\ #{@sub_header.ljust(sub_header_ljust, " ")} | #{"Category".ljust(category_width, " ")} | #{"Priority".ljust(priority_width, " ")} | #{"Due Date".ljust(due_date_width, " ")} |
#{hr}
eos

    print "\e[H\e[2J" #clear the screen
    print header
    @tasks_for_render.each_with_index do |task, i|

      id = task.id.to_s.rjust(spaces_id_column, " ")
      if task.complete? then check = "x" else check = " " end
      task_name = task.name.ljust(task_width, " ")
      category = task.category.name.to_s.ljust(category_width, " ")
      priority = task.priority.to_s.ljust(priority_width, " ")
      due_date = task.due_date.to_s.ljust(due_date_width, " ")

      puts "#{id} [#{check}] #{task_name} | #{category} | #{priority} | #{due_date} |\n"
    end
    puts hr

  end


end