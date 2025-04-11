#!/usr/bin/env nu

#
# Functions
#

# 
# Main
#

# Create running instance of image (container).
def "main create container" [
  --image (-i): string # The name of the image you want to run.
  --tag (-t): string  # The name of the tag you wish to run.
  --registry (-r)="": string # The name of the registry you wish to pull from.
  --interactive=false # Do you run the container as interactive or not.
] {
  print $"($registry)/($image)/($tag)"
}

