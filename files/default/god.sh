#!/bin/bash
#
# god       Startup script for god (http://god.rubyforge.org)
#
# chkconfig: - 85 15
# description: God is an easy to configure, easy to extend monitoring \
#              framework written in Ruby.
#
 
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
