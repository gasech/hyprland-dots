#!/bin/bash

function state() {
  STATE=$(pgrep bluetoothd)
  if [[ -z $STATE ]]; then
    echo 'false'
  else
    echo 'true'
  fi
}

state
