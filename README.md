# HelloWM 

This project is a part of Tinkrers laboratory IITH. In this project I'll be using flutter to create an application which aims to solve the problem of washing machine management in hostels.

## HelloWM - Are you busy?

Washing your clothes in a proper manner in hostels is a big deal. It is very difficult to find a free washing machine in a hostel having 6-10 floors. But, the problem doesn't end here, even you got a free washing machine, you'll have to remember that your clothes are in it, otherwise someone will throw them out, or will wait for a long time.

This app is an attempt to solve this problem, and to see if we can manage the washing machines in the hostels efficiently with an app.

## The Application
### Frontend
The frontend of the app is to be written in flutter in order to make it cross-platform. You can find the User Interface of the app [here](https://tinyurl.com/smartlaundryui). This is the basic idea of the user interface which is to be inplemented in the app. 

**Description of the activities in the app** - 
* **Login/Signup** - Screens of loggin in and signing up for the app
* **Status** - Screen showing the status of all the washing machine on each floor of the hostel
* **Individual Status** - Details of a washing machine
* **Add Clothes** - Input time when adding clothes in a washing machine


### Backend
I've planned to use Firebase as the backend of the application, due to its simplicity and compatibility. Anyone can create a firebase project and test his/her apps on it. 

We implementing the following features
* Using firestore database to store the details of the washing machines
* Using authentication to create accounts and verify them

**Details of the design -** There are two main branches, **hostels** and **users**. **hostels** have the data of all the hostels with all the machines on each of their floors. **users** have the data of all the users registered on the app. Each machine is given an ID relating it to its hostel and floor.
* **status** - status BUSY/FREE 
* **time_left** - time left till it becomes free
* **user** - details of user if it is busy

Each **user** branch is having children corresponding to the details of the registered users like
* **name** - name of the user
* **mobile** - mobile number of the user
* **hostel** - residing hostel of the user
* **room** - room number