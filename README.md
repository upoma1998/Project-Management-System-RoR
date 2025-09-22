
* User Management System (UMS)

* The Project Entity, Attribute and Relationship Diagram
![ruby on rails drawio (1)](https://github.com/upoma1998/Project-Management-System/assets/116708750/dd357e6e-8c25-45ba-aa8e-d1998e3cfb39)

* Project Description:
The project has 3 types of users- Organizations, Members and Admins.
1. In the organization module, admin of an organization can register into the system. After registering,they can create projects under a plan.
2. There are two types of plans- Free Project Plan and Paid Project Plan. An organization can create only one project under the free plan and can create multiple projects    
under the paid plan.
3. Organization can also add members under the plan. When a member is added, he can regsiter into the system and view the project that he has been assigned to.
4. Member can also create tasks and assign tasks to members.

* Requirements Implemented:
1. Authentication of Organization, Member and Admin using Devise JWT.
2. Authorization of Organization and adding controller functions to perform CRUD operations on free projects, paid projects and member modules.
3. Authorization of Admin and adding controller functions to perform operations on organization, free projects, paid projects and member modules.
4. Authorization of Member and adding member controller functions to perform operations on creation, assignment, update and deletion of tasks.
5. Performing the swith of plans between free project and paid project plans.
   
* Ruby version 3.2.0

* Installation:
As the project has been dockerized, The following commands will be required to run the project:
1. docker build .
2. docker compose up

* Database creation:
We have used the postgresql database from the docker container.

* Postman Collection:
https://drive.google.com/file/d/1ObGZ8TkgrQPh1NCDDno1ApHCMfe7uvJi/view?usp=drive_link

