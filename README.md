# useful_material
Here is some material I like to use, including my onwn and other persons templates and explanations, recommendations etc. Shortly: inspiring things.

## git
Very nice link for a git tutorial/ book. If you want to learn git, try this.
https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#Ignoring-Files

## data visualisation
Edward R. Tufte wrote a really nice book which was strongly recommended to me : "The Visual Display of Quantitative Information"

We found that book on http://visualizationuniverse.com/ which seems to definitely be worth checking out!

### R graph gallery
https://www.r-graph-gallery.com/

### cowplot!!
Definitely a very nice package, use cowplot with ggplot2!

## github blog
apparently you can have a github-blog, it's name is *github pages* and here is a very very nice explanation to set it up!
http://jmcglone.com/guides/github-pages/


## How to write and publish a scientific paper - Barbara Gastel and Robert A. Day
Very nice book, find a summary at https://noschenk.github.io/blog/2018/07/12/how-to-write-and-publish-a-scientific-paper


# upload a script while hiding paths `nonpublic`
Sometimes, you would like to share a script, but within that script, you are using paths. You may like to keep those private, e.g. because it's servers addresses of you work or just because.
In such situations, I usually create a script `nonpublic`, which contains all paths. Running it will save all necessary paths to variables.
In the shared script, I then just use the variables and explain that those contain the paths to loaded files.
The person using your script will then just need to fill in the variables accordingly and is able to use your script.

# deepl translator
My favourite real-time translator, it works amazingly well even for whole texts. 
https://www.deepl.com/translator


# R packages
I think it is very useful to store often used code in a specific R package. This allows me to just load the package and use some shortcuts without coding them again and again. Such often used code could contain saving graphs in high quality, the default settings of the write.table function (e.g. quote = F and row.names = F), getting my favourite colors in a vector (e.g. from RColorBreweR) etc.
I try to avoid having project specific code in this general collection - the package should stay small and only/ mostly contain function I really often use - if a specific function is not used any more, it should be deleted. (and saved in another place, e.g. in an inspirational collection of old code)
