#!/usr/bin/env roundup
#
#/ usage:  rerun stubbs:test -m Shestakova -p Oleksandra [--answers <>]
#

# Helpers
# -------
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------
describe "Oleksandra"

# ------------------------------
##Check that command returns the PATH

it_lists_path_var() {

    ##Make a temp file to write to
    OUT=$(mktemp /tmp/Shestakova:Oleksandra-XXXX)
    ##Run module and store result to temp file
    rerun Shestakova:Oleksandra > $OUT

    ##Ensure proper output is present in outfile
    grep $"PATH" $OUT
    ##Delete temp outfile
    rm $OUT

}

##Check that command returns the SHELL var and it is colored correctly
it_lists_correctly_colored_shell_var() {

   ( rerun Shestakova:Oleksandra ) | grep -Pq '\033\[0\;31mSHELL\033\[\d+[;m]=\033\[0\;32m\/bin\/bash'
 
}

# ------------------------------

