#!/usr/bin/env nu

#
# Functions
#

def get_config_value [config: string, key_path: string] {
  let config_value = cat $config | from yaml | get $key_path

  return $config_value
}
