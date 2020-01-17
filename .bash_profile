#
# ~/.bash_profile
#

source $HOME/.profile
source $HOME/.bashrc

# opam configuration
test -r /home/mf/.opam/opam-init/init.sh && . /home/mf/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
