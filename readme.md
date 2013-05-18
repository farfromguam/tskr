tskr
=====

Ruby task manager
By Christopher Fryman
Student NSS 2013


Purpose
-------

The goal of tskr is a simple text based interface acessable via the command line. Using the powers of ruby and the skills learned in class, tskr will soon take over the world.


Features
--------

MVP
* add a task
* mark task as completed

Gravy
* delete task
    tombstoning
* sort
    ascending
    descnding
* sort by task
* sort by due date
* sort by priority


Planned Use
-----------

<call> | <action>    | <target>     | <flag>
       | ARGV[0]     | ARGV[1]      |
----------------------------------------------
tskr   | + (add)     | "task"       | -p -d -c
       | - (remove)  | task id      |
       | x (mark)    | task id      |
       | !x (unmark) | task id      |
       |             |              |
tskr   | +category   | "category"   |
       | -category   | "by name"    |
       |             |              |
tskr   | list        |              |
       | list        | * (all)      |
       | list        |              |
       | list        | "category"   | -a -d
       |             |              |
tskr   | sortby      | t/p/d/c      | -a -d


Flags (handle with ruby optparse)
-p priority
-d due date
-c category
-a ascending order oldest, 0-9, A-Z
-d desending order newest, 9-0, Z-A


Date Entry
hopefully tskr will support common language date entry
tomorrow => day +1
next week => day +7
next month => month +1


Current State
=============

In planning...
simple rake file and tests passing.




To do
-----

[ ] check out shebang(hashbang) - for dropping ruby in terminal call

[ ] Make a task manager


Known Bugs
----------





