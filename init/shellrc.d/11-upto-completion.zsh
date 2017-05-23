_upto_zsh() 
{
    local parents;
    parents=(${(s:/:)PWD});
    compadd -V 'Parent Dirs' -- "${(Oa)parents[@]}";
}

compdef _upto_zsh upto