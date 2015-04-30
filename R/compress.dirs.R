compress.dirs <- function(input=".", outname="compress", outfolder=".", integrity=TRUE) {
  # compress using 7za
  input <- gsub("/", "\\\\", input)
  outpath <- paste("..","..",outfolder, "backups", paste(outname,"7z", sep="."), sep="/")
  lib <- paste("..","..", "inst", "library", "7Zip", "7za.exe", sep="\\")
  file.create("tmp.log")
  code <- paste(lib, "a", outpath, input, ">> tmp.log", sep=" ")
  shell(code)
  
  if (integrity) {
    log <- paste("tmp.log")
    con <- file(log, open = "r")
    line <- readLines(con)
    for (i in 1:length(line)){
      if (line[i] == 'Everything is Ok'){
        msg = "Compress and check"
        break
      } else {
        msg = "Compress with errors, see tmp.log"        
      }
    }
  } else {
    msg = "Compress, but not check"
  }
  close(con)
  
  if(msg == "Compress and check"){
    unlink(log)
  }
  
  return(msg)
}