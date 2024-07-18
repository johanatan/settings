#!/usr/bin/env zsh

# File: ~/.conda-auto-env.zsh

conda_auto_env() {
  local env_file=".conda-env"
  local env_name

  # Find .conda-env file, searching up the directory tree
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -e "$dir/$env_file" ]]; then
      env_name=$(cat "$dir/$env_file" | tr -d '[:space:]')
      break
    fi
    dir=$(dirname "$dir")
  done

  # If .conda-env file found, activate the environment
  if [[ -n "$env_name" ]]; then
    if [[ "$CONDA_DEFAULT_ENV" != "$env_name" ]]; then
      conda activate "$env_name"
    fi
  elif [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    # If no .conda-env file found and we're in a conda env, deactivate it
    conda deactivate
  fi
}

# Function to check for .rc files
check_and_source_rc() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.rc" ]]; then
      source "$dir/.rc"
      return 0
    fi
    dir=$(dirname "$dir")
  done
  return 1
}

# Combine conda_auto_env and .rc file checking
auto_env_and_rc() {
  conda_auto_env
  check_and_source_rc
}

# Set up the chpwd hook to run our function
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_env_and_rc

# Run once at shell startup
auto_env_and_rc