# Generate passwd file based on current uid
function generate_passwd_file() {
  USER_ID=$(id -u)
  GROUP_ID=$(id -g)

  if [ x"$USER_ID" != x"0" -a x"$USER_ID" != x"1001" ]; then

    NSS_WRAPPER_PASSWD=/tmp/passwd
    NSS_WRAPPER_GROUP=/etc/group

    cp /etc/passwd $NSS_WRAPPER_PASSWD
    echo "default:x:${USER_ID}:${GROUP_ID}:Default Application User:${HOME}:/sbin/nologin" >> $NSS_WRAPPER_PASSWD

    export NSS_WRAPPER_PASSWD
    export NSS_WRAPPER_GROUP
    export LD_PRELOAD=libnss_wrapper.so
  fi
}


