#!/bin/bash

function state() {
  STATE=$(pgrep wlsunset)
  if [[ -z $STATE ]]; then
    echo 'off'
  else
    echo 'on'
  fi
}

function toggle() {
  STATE=$(state)
  if [[ $STATE == 'on' ]]; then
    eww update nightlight=true
    pkill wlsunset
  else
    eww update nightlight=false
    wlsunset
  fi
}

function get() {
  STATE=$(state)
  echo "$STATE"
}

if [[ $1 == 'toggle' ]]; then toggle; fi
if [[ $1 == 'get' ]]; then get; fi
