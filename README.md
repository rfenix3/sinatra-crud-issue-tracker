# Sinatra-Issue-Tracker
A Sinatra CRUD (Create Read Update Delete) application for tracking issues.

This application creates, reads, updates, and deletes (CRUD) records stored in an SQL database.  MVC (Model-View-Controller) architectural pattern is followed to ensure separation of concerns within different components .

This is a basic, starter application for managing companies issues that arise from the use of their IT system (applications and hardware). The application is designed to capture issue details such as title, status, create date, and target resolution date (completion date).  The application also allows users to assign issue owners (usually IT technical resources) who are responsible for resolving the issue.

## Technology Used
* Sinatra
* Ruby
* ActiveRecord
* SQLite3

## Pre-requisite
* Integrated Development Environment (IDE)

## Get Started
* Clone repository
```
$ git clone https://github.com/rfenix3/sinatra-crud-issue-tracker.git
```
* Install bundle
```
$ bundle install
```
* Run server
```
$ rackup config.ru
```
* Open web browser and type in the localhost on url window
```
http://localhost:xxxx
```
