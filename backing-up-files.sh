#Creating A BackUp file and calling a function first
BACK_UP() {
#Calling a local variables
  local FILE=${1}  
  #This checks if the file exists
  if [[ -f "${FILE}" ]]  
  then
  #Backing up to var/tmp/ for a 30 day window, %F to get full date
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "Backing Up ${FILE} to ${BACKUP_FILE}."

  #copying the exit status of the Function
    cp -p ${FILE} ${BACKUP_FILE}
  else
  #If the file does not exist, then return a Non Zero Exit status
   return 1
  fi
}
~    
#Calling the function
BACK_UP 'file dir lol'
