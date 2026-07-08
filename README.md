# Part 1 - Using R on the Network

NEFSC has moved to a container setup.  Open a ticket using the helpdesk and IT will setup a container. 
1. Containers sometimes need to be restarted or updated. The files in the root directory will not persist, so save your results somewhere else
2. Persistent startup scripts can be handled on request. Put your [.Rprofile](https://github.com/NEFSC/READ-SSB-Lee-project-template/blob/main/R_code/project_logistics/.Rprofile_sample) into your root directory on ``NEFSCFILE.``  Ask to have it copied into the root of your container every time the container is re-started or reconfigured.  Be mindful of the leading period in ``.Rprofile''.
3. You will have access to an Rstudio development environment. If you so desire, you can execute scripts or unix commands from the ``Terminal`` tab. 


# Part 2 - Other tips

## Terminal (Command line) access

You have access to a unix terminal from inside Rstudio. Use the "Terminal" tab (next to console).

## One of your processes is frozen? 

1.   Use ``top -u <yourid>`` to lookup the process id. Replace ``<yourid>`` with your network id.  
2.   Use ``kill -9 <pid>`` to kill the process number ``<pid>``

This also might be useful if Rstudio hangs indefinitely on loading
    
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


## Moving files with SCP

You might want to move files around on the network.  SCP from the command line might be nice, because you can automate it.  The syntax is

```
scp /full/path/of/files/to/move server:/full/path/of/destination
```
this might useful to put something onto the ftp server or put it into someone else's network folder.


## Use batch files to do jobs  

For Rscripts that take along time to run, you should either run them from the command line with: 

```
Rscript my_fancy_rcode.R
```
Or put them into a batch file and execute a [batch file](batch_RF_run).  


    
# Stuff

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.
