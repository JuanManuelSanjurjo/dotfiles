# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/2w1s"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.

if initialize_session "Editor"; then
	CURRENT_DIR=$PWD
	# Create a new window inline within session layout definition.
	new_window "Editor"
	run_cmd "z $CURRENT_DIR"
	run_cmd "nvim"

	# Create split terminal to run locally and run commands
	new_window "Terminal"
	run_cmd "z $CURRENT_DIR"
	split_h 50
	run_cmd "z $CURRENT_DIR"

	# Lazygit terminal
	new_window "Lazygit"
	run_cmd "z $CURRENT_DIR"
	run_cmd "lazygit"

	# OPENCODE chat
	new_window "OPENCODE"
	run_cmd "z $CURRENT_DIR"
	run_cmd "opencode"

	# Select the default active window on session creation.
	select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
