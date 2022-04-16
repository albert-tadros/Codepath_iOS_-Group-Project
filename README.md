# Codepath_iOS_Gather

# Gather

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
- Gather is a workflow tracking and project management iOS application. 

### App Evaluation
- **Category:** Business / Developer Tools
- **Mobile:** The primary development goal is iOS deployability, but the frontend functionality could easily be scaled to other platform like web or Android.
- **Story:** Providers workplaces and teams a platform to assign, track, and collaborate on open issues. Managers can assign tasks and schedule tasks to employees. 
- **Market:** This app is commercial software targetting a business demographic including product managers and development teams. A competitor in this space would be Atlassian's Jira. 
- **Habit:** This app is intended to be used in day-to-day business/development, so use will vary on the users' workload. 
- **Scope:** Initially, we want to develop the requisite functionality for managers to assign and schedule tasks to employees. Employees can update the status of open tasks and check their daily, weekly, and monthly schedule. Upon task completion, managers can provide feedback to employees for follow-up or adjustments. Future development goals could center around refining the UI as well as allowing employees to communicate with one another and their managers. 

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to access previous updated schedule
* User can add his/her profile and edit 
* User can add there schedule and tasks 
* User can change or update the status of each task such as pending, in progress, done or blocked
* User (manager) picks the team and check the schedule of each team and members
* User can check the schedule and tasks by daily, weekly and monthly
* User (manager) can give some feedback for each team member regarding their schedule and working progress

**Optional Nice-to-have Stories**

* User can edit the priority of each task and each task will be highlighted with different color according to its prioroty
* User can get alert if the task is over due

### 2. Screen Archetypes

* Start Screen
   * User is greeted with app logo and background the presented the option to either sign into an existing account or register for a new account. 
* Login 
   * Existing users can enter their login credentials (email and password) to sign in.  
* Register
   * New users can register for a new account by providing their first name, last name, email address, and selected password. 
* Homepage
   * Users are presented with a button to view their pending tasks. 
   * Managers are presented with an additional button to access team management functionality. 
* Profile 
   * Presents a user's name, organizational role, and contact information. 
* Tasks 
   * Displays a list of assigned tasks with a title, brief description, and due date. 
* Teams (Manager Specific)
   * Lists teams within the organization.  
* Members (Manager Specific)
   * Lists members within a specific team.  
* Add Task (Manager Specific)
   * Managers can assign a new task to a member and specify the priority, task description, and due date via a calendar. 
* Edit Task (Manager Specific)
   * Managers can delete or edit an existing task. 
   
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Team
* Schedule
* Profile
* Logout

Optional:
* Sorting schedule by priority
* Discover (Top Choices)

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Log-in  -> main page
* Team -> selction be team -> display all schedule of team members.
* schedule -> selection by daily, weekly or monthly


### Wireframes
## UI Route for a Manager Account:
<img width="1188" alt="Screen Shot 2022-04-11 at 4 24 50 AM" src="https://user-images.githubusercontent.com/78925894/162696502-7dc88f59-4a49-4185-842b-34408d92ea73.png">

## UI Route for a Non-Manager Account:
<img width="1173" alt="Screen Shot 2022-04-11 at 4 27 04 AM" src="https://user-images.githubusercontent.com/78925894/162696600-89bd415b-fa9c-46f0-9ec6-28e0ceb00e7d.png">


### App Demo (for the progress made so far)

Part 1

![Gather initial demo_part1](https://user-images.githubusercontent.com/78925894/162560139-c0f9215b-e13e-4359-b0b8-20d1f59061a3.gif)

Part 2

![Gather initial demo_part2](https://user-images.githubusercontent.com/78925894/162560145-007b6670-50b0-412a-8a87-892cd3de98a4.gif)

Part 3

![Gather initial demo_part3](https://user-images.githubusercontent.com/78925894/162560160-6aca6a9e-03ab-4594-ba5a-746a90c612b2.gif)

### App Demo (Unit 8)
Part 1

![gather_w8_pt1](https://user-images.githubusercontent.com/78925894/163688489-3eea86f3-d295-422d-881c-1ccd0cfa2634.gif)

Part 2

![gather_w8_pt2](https://user-images.githubusercontent.com/78925894/163688493-c2b8bc1b-7c31-4f56-9b8b-62ef49ad0948.gif)
