_upto_zsh() 
{
    local parents;
    local parents=(${(s:/:)PWD});
    compadd -V 'Parent Dirs' -- "${(Oa)parents[@]}";
}

compdef _upto_zsh upto