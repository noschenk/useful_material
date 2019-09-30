# RStudio and Windows network drives
In case this sentence triggers you to swear, this is the file you should read.

It happened to me, that when working in RStudio (Projects) on a Windows network drive, I was not able to save files to the drive.
I was able to save them to my Desktop or any location but the network drive. 
This is a quite annoying problem in case you are working with a company network drive.

There is a solution for it!!

The trick is to map your network drive to a computer drive, like "T:" or "L:".
Once you did that, open RStudio > Tools > Global Options and change the path to "R version:" to the new letter, e.g. T:Documents\.
(Instead of the crazy "\\\drive\blabla\Documents" thing which is written there.)

Then also change the Default working directory (when not in a project) to the chosen letter (e.g. T:/Documents)

You will need to restart R in case it's not yet working. I also had to close and re-open my project, but it's working now!!
