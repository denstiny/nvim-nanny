fun! JavaX() 
	let l:c = input("input java class: ")
	let l:sh = 'java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y '
	let l:e = system("cp ~/.config/nvim/vimspector-json/java.json ./")
	let l:javac = 'javac -g ' . l:c .'.java'
	let l:debug =  l:sh . l:c
	call TerminalSend(l:javac . "\r")
	call TerminalSend(l:debug . "\r")
	exec 'CocCommand java.debug.vimspector.start'
endf
