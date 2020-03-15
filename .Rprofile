# q <- function(save = "no") .Internal(quit(save))

.First <- function() {
	options(prompt="R> ", continue="+\t")  # R> is the prompt
	options(digits=5, length=999)         # custom numbers and printout
	options(papersize="letter")
	options(show.signif.stars=FALSE)
#	options(show.coef.Pvalues=F)
#	ps.options(hor=F)
    options(contrasts = c("contr.treatment", "contr.poly"))
	cat(paste("\nWorking Directory is:",getwd()," --  use setwd(dir) to change it ","\n"))
#
    r <- getOption("repos")             # hard code the US repo for CRAN
    r["CRAN"] <- "http://cran.us.r-project.org"
    options(repos = r)
    rm(r)
    options(help_type="html")
 }

update.local <- function() {
        update.packages(checkBuilt=TRUE, ask=FALSE)
}

Subset <- function(x, ...){
       droplevels(subset(x,...))
       }

#
#  source(file.path(Sys.getenv("HOME"), "R", "mystuff.R"))
                                        # my personal package
#
#                                        
# Get rid of the default question as to whether you want to save the workspace                                        
#setHook(packageEvent("Defaults", "attach"),
#  function(...) { setDefaults(q, save="no"); useDefaults(q) })
## add Defaults to the default packages loaded on startup
#old <- getOption("defaultPackages");
#options(defaultPackages = c(old, "Defaults"))
#
utils::assignInNamespace(
  "q", 
  function(save = "no", status = 0, runLast = TRUE) 
  {
    .Internal(quit(save, status, runLast))
  }, 
  "base"
)


.Last <- function() {
  graphics.off()                        # a small safety measure.
#  rm(.First)                            # need this for using the .Rprofile on different machines!
  cat(paste(date(),"\nAdios\n"))        # Is it time for lunch?
}


