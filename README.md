# Running R on one of the network servers using putty!

Many of the NEFSC servers have Rstudio that is accessible by browser.  Sometimes, you will want to R directly directly. This will help you do that.

This is adapted from Liz Brooks's powerpoint documentation, in which she has collected wisdom from David Hiltz

Please help make this a valuable up-to-date resource.  To add your knowledge:
1.   [Fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) - It's in the top right of github.
1.   Make your changes  - click the file you want to edit and then the little pencil on the right side.  ![Here's a picture](/images/fork_edit.jpg)
1.   [Pull Request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork) so the changes get into the document.


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
1. "cd" into directory where you have an R script that you want to run (for me that is Git/IBMWG) 

# Part 4 - Use Screen

Using screen is important. It allows you to run a process in the background that will continue even if you  get disconnected. You might get disconnected if you are on VPN.

1.  "screen -S my_fancy_rcode_session"
    1. "screen" opens a session
    1. " -S " gives the session a name.
    1. "my_fancy_rcode_session" is the name of the session. Since you can have multiple screens, it helps to give a descriptive name. Perhaps the name of the script that you are going to run. 
  
The PuTTY window might flash and you will end up at a screen that looks like this: 

![Login Screen](/images/screen1.jpg)

# Part 5 -  Run your code
Run your code with Rscript. 

```
"Rscript my_fancy_rcode.R" ; mailme First.Last@noaa.gov "my_fancy_rcode complete"
```

The first part runs the R script file called "my_fancy_rcode.R" that is stored in the directory that you are in.

The mailme command will send you an email to "First.Last@noaa.gov" with the message "my_fancy_rcode complete" . This is optional.  It is particularly useful if your code takes a long time to run: you'll get a message that it's done. Not all of the servers have this functionality.

littler is another modern way to run R from the terminal. R CMD BATCH and R are older methods that you might see on the internet.  They are probably not as good.

# Part 6 - Check and Detach

Make sure your code has started to run:
![It's working](/images/r_running.jpg)

And then you can detatch with Ctrl a d.  (Hold Ctrl then press a, then press d).  You can open up another session, by doing steps 4-6 again.  But don't be a jerk an use up all the processing power.


# Part 7 - Results  and Cleanup.
If your code ran properly, you'll get an email that says "my_fancy_rcode complete".
1. Open the session back up with
screen -r "my_fancy_rcode"

and take a look for any error messages.  If there are none, you can just type "exit" to terminate the screen.  Then you can log out of putty with another "exit"


# Part 8 - Tips for Screen
1. List all your screen screen -ls 
1. Shut down a screen  "screen -XS my_fancy_rcode_session quit"
1. Reconnect "screen -r my_fancy_rcode_session
1. Create "screen -S my_fancy_rcode_session"


# Part 9 - Other tips

## What Linux Servers

[Learn about the NEFSC Linux servers](https://localonly.nefsc.noaa.gov/linux/Servers)

## What else is running?
To see what else is running, use the unix command "top":
![top](/images/top.png)

Total CPU usage is in Green (0.2%, so not much is going on right now.)
The user name,  CPU, and Memory usage is circled in Red. The CPU column is based on a single computer instance, so don't be surprised if it shows something like 395%.





## How much memory is available?

To see the amount of memory available use  "free -g"

![free](/images/free_memory.jpg)

Only look at the available column, in this case that's 115 gigabytes.


## Play nicely with others


If there are alot of other things running on the server, you can do this:
```
nice R < "your script here.R" --no-save
```

or 

```
nice Rscript my_fancy_rcode.R
```

There's a way to set the exact level of depriortiziation, but I've not gotten it right. Default is 0. Positive numbers make your script "more nice" (so lower priority). You can't set negative numbers as a regular user. 




# Stuff

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.
