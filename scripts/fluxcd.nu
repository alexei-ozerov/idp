#!/usr/bin/env nu

#
# Functions
#

# 
# Main
#

# Manage FluxCD actions.
def "main create flux" [] {}

# Create a bootstrap deployment of Flux for a given repository.
def "main create flux bootstrap github test" [
  --owner: string # Github username
  --repository: string # Repository name
  --branch: string = "main" # (Optional) Override default branch name
  --path: string = "." # (Optional) Override default path to repo
] {
  (flux bootstrap github 
    --token-auth 
    --owner=my-github-username 
    --repository=my-repository-name 
    --branch=main 
    --path=clusters/my-cluster 
    --personal)
}


def "main create flux github bootstrap" [] {
  (flux bootstrap github 
    --token-auth 
    --owner=alexei-ozerov 
    --repository=idp 
    --branch=main 
    --path=./fluxcd/clusters/development 
    --personal 
    --private=false)
}

