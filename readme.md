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

Task Actions
+  | Add Task     | Add by "name"
-  | Remove Task  | Address by ID
x  | Mark Task    | Address by ID
!x | Unmark Task  | Address by ID

Task Flags
-c category -- New or Existing
-p priority -- string
-d due date -- date YYYY-MM-DD

Category Actions
+category   | Add by "name"
-category   | Address by "name"

Category Flags
-p priority -- string
-d due date -- YYYY-MM-DD

List Action
list

Sort Flags (coming soon)
-a ascending order oldest, 0-9, A-Z
-d desending order newest, 9-0, Z-A

Date Entry
hopefully tskr will support common language date entry
tomorrow => today +1
next week => today +7
next month => month +1


Current State
=============

Just about ready for Project Demos


To do
-----

[x] Update Readme
[ ] Implement sort feature
[ ]


Known Bugs
----------

Date input changes type and does not pass tests.




