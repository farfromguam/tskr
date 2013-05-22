#!/usr/bin/env ruby

arg_hash = {}

ARGV.each_with_index{ |val, idx|
  if val == "+"
    arg_hash[:new_task] = "#{ARGV[idx+1]}"
  elsif val == "+cat"
    arg_hash[:new_category] = "#{ARGV[idx+1]}"
  elsif val == "-c"
    arg_hash[:category] = "#{ARGV[idx+1]}"
  elsif val == "-d"
    arg_hash[:due_date] = "#{ARGV[idx+1]}"
  elsif val == "-p"
    arg_hash[:priority] = "#{ARGV[idx+1]}"
  elsif val == "-"
    controller.remove_task
  elsif val == "x"
    #mark task
  elsif val == "!x"
    #unmark task
  elsif val == "l"
    #list them
  end
}


puts arg_hash