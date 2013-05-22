class TskrController

  def initialize params
    @params = params
  end

  def query_category
    Category.where( name: @params[:name] ).first
  end

  def add_category
    category = Category.create( name: @params[:name] )
    if category.save
      puts "Success!"
    else
      puts "Failure."
    end
  end

  def remove_category
    Category.where( name: @params[:name] ).first.destroy
  end

  def add_task
    #SEARCH FOR MATCHNG CATEGORY
    category = query_category
    if category.nil?
      add_category
    end
    Task.create( name: @params[:name], category: @params[:category] )
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

end