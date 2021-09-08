; Go to log script, ready to input arg
; key: WIN+[
#[::
Send, #r
sleep, 500
SendInput, "_SHELL_PATH_"
sleep, 200
Send, {Enter}
sleep, 500
SendInput, cd "_LOG_PARENT_PATH_"
sleep, 200
Send, {Enter}
SendInput, sh ammend_log.sh{SPACE}
return