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

  def calculate_column_widths
     @task_id_column = Task.last.id.to_s.length
       @check_column = 5
        @task_column = 37
    @category_column = 14
    @priority_column = 12
    @due_date_column = 10
    @table_width = @task_id_column + @check_column + @task_column + @category_column + @priority_column + @due_date_column + 11
  end

  def print_header
    sub_header_ljust = @task_id_column + @check_column + @task_column - 19
    puts header = <<-eos
___ ____ _  _ ____
 |  [__  |_/  |__/
 |  ___] | \\_ |  \\ #{@sub_header.ljust(sub_header_ljust, " ")} | #{"Category".ljust(@category_column, " ")} | #{"Priority".ljust(@priority_column, " ")} | #{"Due Date".ljust(@due_date_column, " ")} |
eos
  end

  def print_hr
    puts hr = "-" * @table_width
  end

  def print_tasks_table
    @tasks_for_render.each_with_index do |task, i|

      id = task.id.to_s.rjust(@task_id_column, " ")
      if task.complete? then check = "x" else check = " " end
      task_name = task.name.ljust(@task_column, " ")
      category = task.category.name.to_s.ljust(@category_column, " ")
      priority = task.priority.to_s.ljust(@priority_column, " ")
      due_date = task.due_date.to_s.ljust(@due_date_column, " ")

      print "#{id} [#{check}] #{task_name} | #{category} | #{priority} | #{due_date} |\n"
    end
  end

  def render
    parse_render_options
    calculate_column_widths
    print "\e[H\e[2J" #clear the screen
    print_header
    print_hr
    print_tasks_table
    print_hr
  end

end