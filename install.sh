# create directory to store data
mkdir -p "$HOME/Documents/.script/database/ignorable/temp"
mkdir -p "$HOME/Documents/.script/database/ignorable/base"
installer_path="$(dirname ${BASH_SOURCE[0]})"
destination_path="$HOME/Documents/.script"
script_name='say.sh'
script_identifier='alieff/terminal-say'
alias_name='say'

# copy the script 
if [[ -z "$(ls $destination_path | grep $script_name)" ]]; then 
  # copy source
  "cp" "$installer_path/$script_name" "$destination_path"
  echo "Copying done" : "cp $installer_path/$script_name" "$destination_path"
else # case if already installed
  echo 
  echo "$script_name executable is already exist"
  echo
fi

# register the script for auto source
if [ -z "$(cat $HOME/.bashrc | grep $script_identifier)" ]; then 
  # add identifier
  echo "# $script_identifier" >> $HOME/.bashrc
  # add auto source script
  "echo" "source $destination_path/$script_name" >> $HOME/.bashrc
  echo "registering to bashrc done"
  echo "if you want to remove just edit '$HOME/.bashrc'"
else # case if already installed
  echo 
  echo "$script_name auto source is already defined / alias already defined"
  echo
fi
