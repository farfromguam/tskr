tskr
====

Ruby task manager <br>
By Christopher Fryman <br>
Student NSS 2013


Purpose
-------

The goal of tskr is to be a simple text based task list acessable via the command line.

Features
--------

* add a task
* delete a task
* mark task as completed
* unmark a task
* List all tasks
* List incomplete tasks
* List complete tasks
* List tasks by Category

###coming soon:
* List by due date range
* list by priority range
* Category due date and Priority inheritance


Use
---

Tskr is a standard ruby app,
tests can be run by using `rake`


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
    list " " -- Lists all incomplete
    list complete
    list all
    List "category" -- shows only category


Coming Soon
-----------

Sort Flags
* "-a" ascending order oldest, 0-9, A-Z
* "-d" desending order newest, 9-0, Z-A

Common language date entry
* tomorrow => today +1
* next week => today +7
* next month => month +1


Current State
=============

[![Build Status](https://travis-ci.org/farfromguam/tskr.png)](https://travis-ci.org/farfromguam/tskr)<br>
Project Demos over, Ready for stage Two


To do
-----

* Implement sort feature
* Implement category inheratance


Known Bugs
----------

Date input changes type and does not pass tests.


Usage
=====

The MIT License (MIT)

Copyright (c) 2013 Christopher Fryman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
