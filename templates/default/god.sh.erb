#!/bin/bash
### BEGIN INIT INFO
# Provides:          god
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Process monitoring with God
# Description:       God is an easy to configure, easy to extend monitoring framework written in Ruby.
### END INIT INFO

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CONF_DIR=/etc/god
GOD_BIN=god
RETVAL=0
 
# Go no further if config directory is missing.
[ -d "$CONF_DIR" ] || exit 0
 
case "$1" in
    start)
      # Create pid directory
      $GOD_BIN -c $CONF_DIR/master.conf
      RETVAL=$?
  ;;
    stop)
      $GOD_BIN terminate
      RETVAL=$?
  ;;
    restart)
      $GOD_BIN terminate
      $GOD_BIN -c $CONF_DIR/master.conf
      RETVAL=$?
  ;;
    status)
      $GOD_BIN status
      RETVAL=$?
  ;;
    *)
      echo "Usage: god {start|stop|restart|status}"
      exit 1
  ;;
esac
 
exit $RETVAL
