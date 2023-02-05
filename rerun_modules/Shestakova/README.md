# KPI_DevOps_Rerun_Task

## Simple rerun module to list all environment variables

### RERUN  
Rerun - a modular shell automation framework to organise your keeper scripts.

Rerun is a simple framework that turns loose shell scripts into modular automation. Rerun will help you organise your scripts into user friendly commands. 

### Install rerun:

Simply "git clone" :
`$ cd $HOME`
`$ git clone git://github.com/rerun/rerun.git`
`$ cd rerun`


Next update .bash_profile with a line like so:
`$ [ -r $HOME/rerun/etc/bash_completion.sh ] && source $HOME/rerun/etc/bash_completion.sh`

Setup the environment variables:
`$ export PATH=$PATH:$HOME/rerun`
`$ export RERUN_MODULES=$HOME/rerun/modules`
`$ [ -t 0 ] && export RERUN_COLOR=true`
 
### Create a Module & Command

`$ rerun stubbs:add-module --module Shestakova --description "Task 1 module" `

`$ rerun stubbs:add-command --module Shestakova --command Oleksandra --description "returns a list of environment variables" `

Open the file ~/rerun/modules/Shestakova/commands/Oleksandra/script for editing with yours favourite editor and replace the ‘Put the command implementation here’ with necessary code and save the script-file.  

Test the script:
`$ rerun Shestakova:Oleksandra`

### Write Tests

Tests will help us ensure module script is working the right way.

Open ~/rerun/modules/Shestakova/tests/Oleksandra-1-test.sh for editing. 
Remove the whole ‘it_fails_without_a_real_test’ block and provide function(s) for tests.

Check that the output of the stubbs:test command to make sure the tests pass.
`$ rerun stubbs:test -m Shestakova -p Oleksandra`

