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
      puts "New task #{@params[:task_name]} added"
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

banner = <<-eos
        /)
_/_ _  (/_  __
(__/_)_/(__/ (_
eos




end