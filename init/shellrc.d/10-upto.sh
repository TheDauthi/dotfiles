upto()
{
    if [ -z "$1" ]; then
        return
    fi
    local upto=$1
    cd "${PWD/\/$upto\/*//$upto}"
}

function up()
{
    if [[ "$#" < 1 ]] ; then
        cd ..
    else
        CDSTR=""
        for i in {1..$1} ; do
            CDSTR="../$CDSTR"
        done
        cd $CDSTR
    fi
}
