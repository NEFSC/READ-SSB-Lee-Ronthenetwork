# Running R on one of the network servers using putty!

This is adapted from Liz Brooks's powerpoint documentation, in which she has collected wisdom from David Hiltz

# Part 1 - Download and Install Putty
You need to have a way to connect to the NEFSC servers. For windows users, PuTTY is a good choice.  [Here's your download link](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).  Chances are you want the 64 bit windows installer. 

# Part 2 - Optional WinSCP
While you are installing things, you might want to get [WinSCP](https://winscp.net/eng/download.php). This lets you transfer files to a server easily. Of course, you can use the file manager built into windows or do it from the command line. 

# Part 3 - Connect to the One of the Unix Servers, log in, and go to your working directory.

1. Get onto the NEFSC network, either by VPN or by going to the office.
1. Launch PuTTY
1. Type in the host name of the server (blue).  
    1.  We can't put these details on github, so contact DMS if you don't know them.
    1.  If you're going to do this more than 1 or two times, save connection details (purple) 
1. Click "Open" (green)

![Putty Launch](/images/putty_pic.jpg)


You will be greeted with a bland looking login screen.
![Login Screen](/images/login_screen.png)

1. Use your network login (not your email)
1. When you type your password, no characters will show up.
1. "cd"" into directory where you have an R script that you want to run (for me that is Git/IBMWG) 

# Part 4 - Use Screen

Using screen is important. It allows you to run a process in the background that will continue even if you  get disconnected. You might get disconnected if you are on VPN.

1.  "screen -S run25_session"
  1. "screen" opens a session
  1. " -S " gives the session a name.
  1. "run25_session" is the name of the session. Since you can have multiple screens, it helps to give a descriptive name. Perhaps the name of the script that you are going to run. 
  
The PuTTY window might flash and you will end up at a screen that looks like this: 

![Login Screen](/images/screen1.jpg)




# Tips for Screen
1. List all your screen screen -ls 
1. Shut down a screen  "screen -XS [session # or name you want to quit] quit""

# Stuff

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.
