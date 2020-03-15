filename <- commandArgs(TRUE)
library(knitr)
library(tools)
library(stringr)

## set options

##opts_knit$set(self.contained=FALSE, verbose=TRUE)

res <- knit(filename)

ext <- file_ext(filename)

if (ext %in% c("Rnw","rnw")) {
      runwhat <- "run (pdf)LaTeX on"
      newfilename <- sub(ext,"tex",filename,fixed=TRUE)
} else if (ext %in% c("Rhtml","Rmd","Rtex","Rrst")) {
      runwhat <- "look at the result in"
      newext <- sub("R","",ext,fixed=TRUE)
      newfilename <- sub(ext,newext,filename,fixed=TRUE)
} else {
      ##runwhat <- "change the file extension of "
      cat("!!! No valid file extension !!! \n\n", file=stderr())
      return
      }

if (ext == "Rmd"){
   markdown::markdownToHTML(res, str_c(file_path_sans_ext(res), ".html"))
}
##knitr:::knit_log$get("error") ## returns list of errors
##knitr:::knit_log$get() ##

error_list <- knitr:::knit_log$get("error")
error_count <- length(error_list)

if(is.null(error_list)){  ## No error by knitr
    cat("\nYou can now", runwhat, newfilename, "\n\n", file=stdout())
}else {
    cat("\nThere are", error_count, "error(s) in", filename, "\n\n", file=stderr())
    for(n in 1:error_count){
        cat("Error", n, error_list[[n]], "\n", file=stderr())
        }
##        cat("\n", file=stdout())
} #else{ ## Error in knitr
