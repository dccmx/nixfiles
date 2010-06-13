#!/bin/bash  
  
TMUX="tmux"  
  
$TMUX has-session -t default  
  
if [ $? = 1 ]; then  
    echo "$TMUX new-session -s default"  
    $TMUX new-session -s default  
 else  
     echo "$TMUX attach-session -d -t default"  
     $TMUX attach-session -d -t default  
fi  
