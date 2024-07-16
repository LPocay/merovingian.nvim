test:
	echo "---> Running tests"
	nvim --headless --noplugin -u scripts/minimal.vim -c "PlenaryBustedDirectory lua/merovingian/tests/ {minimal_init = 'scripts/minimal.vim'}"
