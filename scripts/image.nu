#!/usr/bin/env nu

source ./lib/init.nu
source ./lib/util.nu

#
# Functions
#

# 
# Main
#

# Create image, building & pushing it to registry.
def "main create image" [
  --image (-i): string # The name of the image you want to create.
  --tag (-t): string  # The name of the tag you wish to apply.
  --registry (-r)="": string # (optional) Override the default name of the registry you wish to push to.
  --dockerfile (-d)="dockerfile": string # (optional) Override the name of the dockerfile you wish to build.
  --context (-c)=".": string # (optional) Override the directory to use as context for the build.
] {
  mut registry_value = ""
  if $registry == "" { 
    $registry_value = (get_config_value return_config_location ".containerization.registry")
  } else {
    $registry_value = $registry
  }

  # (ozerova) TODO: Add validations to make sure the string doesn't end with a slash and begins with the right protocol.
  print $"($registry_value)/($image)/($tag)"
}

