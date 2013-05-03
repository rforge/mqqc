successDelete <- 
  function(hotFolder,sucFolder = "_RmqqcFile_Processed",destDelete = F)
  {
    tempI <- list.files(listFolders(hotFolder),pattern = "evidence.txt",full.name = T,recursive = T)
    mqqcInfo <- NULL
    
    if(length(tempI) > 0){
        repl <- paste(hotFolder,"/",sep = "")
        repl <- gsub("//","/",repl)
        folderName  <- gsub(repl,"",tempI,fixed = T)
        #folderName  <- gsub("//","",folderName,fixed = T)
        
        folderName  <- strsplit(folderName,"/")
        folderNameVec <- c()
        for(i in 1:length(folderName)){
          folderNameVec <- c(folderNameVec,folderName[[i]][1])
        }
        
        if(length(tempI)> 0){
          # Check if evidence was already processed if yes, no output of evidence path
          mqqcInfo <- c()
          for(i in 1:length(tempI)){
            tempmqqcInfo  <- list.files(dirname(tempI[i]),pattern = "mqqc",full.name = "T")
            if(length(tempmqqcInfo)!=0){
                dir.create(sucFolderPath <- paste(hotFolder,sucFolder,sep = "/"))
                file.rename(tempmqqcInfo,paste(sucFolderPath,paste(Sys.Date(),folderNameVec[i],sep = "_"),sep = "/"))
                fileDelete <- paste(hotFolder,folderNameVec[i],sep = "/")
                listFiles <- list.files(fileDelete,recursive = T,full.name = T)
                listFiles <- unlist(lapply(listFiles,checkSize))
                if(destDelete & all(listFiles == 0)){
                  unlink(fileDelete,recursive  = T) 
                  Sys.sleep(0.5)
                  unlink(fileDelete,recursive  = T) 
                  
                }
            }
            
          }
          # mqqcInfo   <- mqqcInfo[file.info(mqqcInfo)$isdir]
          
        }
    }
    return(mqqcInfo)
  }