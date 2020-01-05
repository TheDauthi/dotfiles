####
# upto completion for zsh

_upto_zsh() 
{
    local parents=(${(s:/:)PWD});
    compadd -V 'Parent Dirs' -- "${(Oa)parents[@]}";
}

compdef _upto_zsh upto