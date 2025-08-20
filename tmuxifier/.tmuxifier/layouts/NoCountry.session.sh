# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/NoCountry"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.

session_root "/mnt/c/Users/juanm/Desktop/C20-48-t-python-react-"

if initialize_session "NoCountry"; then

	# Crear una ventana llamada 'Neovim' y abrir Neovim en el directorio especificado
	new_window "Neovim"
	run_cmd "nvim"

	# Crear una ventana llamada 'Terminal'
	new_window "Terminal"
	split_h 50

	# Seleccionar la ventana por defecto
	select_window "Neovim"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
