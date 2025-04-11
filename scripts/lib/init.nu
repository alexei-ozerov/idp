#!/usr/bin/env nu

const CONFIG_LOCATION: string = "./.config.yaml"
const DEFAULT_CONFIG_LOCATION: string = "./.config.default.yaml"

#
# Functions
#

# (ozerova) TODO: add config validation.

def return_config_location [] {
  return $CONFIG_LOCATION
}

def reconfigure [] {
  rm $CONFIG_LOCATION
  create_default_configuration 
}

def create_default_configuration [] {
  if not (($CONFIG_LOCATION) | path exists) {
    print $"\nCreating default configuration in ($CONFIG_LOCATION)."
    cp $DEFAULT_CONFIG_LOCATION $CONFIG_LOCATION

    let engine: string = (set_container_engine) 
    let registry: string = (set_registry)

    cat ($CONFIG_LOCATION) | from yaml | update containerization.engine $"($engine)" | to yaml | save $CONFIG_LOCATION -f
    cat ($CONFIG_LOCATION) | from yaml | update containerization.registry $"($registry)" | to yaml | save $CONFIG_LOCATION -f

    print "\nConfiguration complete!\n"
  }
}

def set_container_engine [] {
  print "Please select the number which represents the containerzation engine you wish to use by default:\n"
  print "    1) Podman"
  print "    2) Docker\n"
  mut engine = ""
  let engine_selection: string = (input)
  if $engine_selection == "1" {
    $engine = "podman"
  } else if $engine_selection == "2" {
    $engine = "docker"
  } else {
    print "Please enter a valid selection (ie. 1 or 2)\n"
    set_container_engine 
  }
  
  return $engine
}

def set_registry [] {
  print "\nPlease enter the registry you wish to use:\n"
  let registry: string = (input)

  return $registry
}

