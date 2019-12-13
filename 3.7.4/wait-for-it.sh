CHECK_HOST=${CHECK_HOST}
CHECK_PORT=${CHECK_PORT}
WAITTIME=${WAITTIME:-1}
WAITCNT=${WAITCNT:-5}

wait_for()
{
    cnt=0
    while [ $WAITCNT -gt $cnt ]
    do
        nc -z $CHECK_HOST $CHECK_PORT
        WAITFORIT_result=$?
        if [ $WAITFORIT_result -eq 0 ]; then
            break
        fi
        echo "wait"
        sleep $WAITTIME
        cnt=$((cnt + 1))
    done
    return $WAITFORIT_result
}

for OPT in "$@"
do
    case $OPT in
        -h)
            CHECK_HOST="$2"
        ;;
        -p)
            CHECK_PORT=$2
        ;;
        -wt)
            WAITTIME=$2
        ;;
        -wc)
            WAITCNT=$2
        ;;
        --)
            shift
            WAITFORIT_CLI=("$@")
    esac
    shift
done
wait_for
exec "${WAITFORIT_CLI[@]}"