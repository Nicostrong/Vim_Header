function! InsertHeader_C()

	" formatage de la ligne 4 avec le nom du fichier courant

	let line4 = "/*   " 
	let line4_end = ":+:      :+:    :+:   */"
	let length_var_filename = strlen(g:filename)
	let space_need_line4 = 80 - (len(line4) + len(line4_end)) - length_var_filename
	let spaces_line4 = repeat(' ', space_need_line4)
	let formated_line4 = strpart(line4, 0, len(line4)) . g:filename . spaces_line4 . strpart(line4_end, 0, len(line4_end))

	" formatage de la ligne 6 avec le nom du proprietaire et son adresse mail

	let line6 = "/*   By: "
	let line6_end = "+#+  +:+       +#+        */"
	let length_var_username = strlen(g:username)
	let length_var_mail = strlen(g:email)
	let space_need_line6 = 80 - (len(line6) + len(line6_end)) - length_var_username - length_var_mail
	let spaces_line6 = repeat(' ', space_need_line6)
	let formated_line6 = strpart(line6, 0, len(line6)) . g:username . g:email . spaces_line6 . strpart(line6_end, 0, len(line6_end)) 

	" Création du header

	call setline('1', "/* ************************************************************************** */")
	call setline('2', "/*                                                                            */")
	call setline('3', "/*                                                        :::      ::::::::   */")
	call setline('4', formated_line4)
	call setline('5', "/*                                                    +:+ +:+         :+:     */")
	call setline('6', formated_line6)
	call setline('7', "/*                                                +#+#+#+#+#+    +#+          */")
	call setline('8', "/*   Created: " . g:date_born . " by " . g:username . "        #+#    #+#             */")
	call setline('9', "/*   Updated: " . g:date_update . " by " . g:username . "       ###   ########.lu       */")
	call setline('10', "/*                                                                            */")
	call setline('11', "/* ************************************************************************** */")
	call setline('12', "")
	autocmd BufReadPost * 12
	autocmd BufWinEnter * call cursor (13,1)

	let g:HeaderInsert = 1

endfunction

function! InsertHeader_SH()

	" formatage de la ligne 3 avec le nom du fichier courant

	let line4 = "#    " 
	let line4_end = ":+:      :+:    :+:    #"
	let length_var_filename = strlen(g:filename)
	let space_need_line4 = 80 - (len(line4) + len(line4_end)) - length_var_filename
	let spaces_line4 = repeat(' ', space_need_line4)
	let formated_line4 = strpart(line4, 0, len(line4)) . g:filename . spaces_line4 . strpart(line4_end, 0, len(line4_end))

	" formatage de la ligne 6 avec le nom du proprietaire et son adresse mail

	let line6 = "#    By: "
	let line6_end = "+#+  +:+       +#+         #"
	let length_var_username = strlen(g:username)
	let length_var_mail = strlen(g:email)
	let space_need_line6 = 80 - (len(line6) + len(line6_end)) - length_var_username - length_var_mail
	let spaces_line6 = repeat(' ', space_need_line6)
	let formated_line6 = strpart(line6, 0, len(line6)) . g:username . g:email . spaces_line6 . strpart(line6_end, 0, len(line6_end)) 

" Création du header

	call setline('1', "#  **************************************************************************  #")
	call setline('2', "#                                                                              #")
	call setline('3', "#                                                         :::      ::::::::    #")
	call setline('4', formated_line4)
	call setline('5', "#                                                     +:+ +:+         :+:      #")
	call setline('6', formated_line6)
	call setline('7', "#                                                 +#+#+#+#+#+   +#+            #")
	call setline('8', "#    Created: " . g:date_born . " by " . g:username . "         #+#    #+#             #")
	call setline('9', "#    Updated: " . g:date_update . " by " . g:username . "        ###   ########.lu       #")
	call setline('10', "#                                                                              #")
	call setline('11', "#  **************************************************************************  #")
	call setline('12', "")
	autocmd BufReadPost * 12
	autocmd BufWinEnter * call cursor (13,1)

	let g:HeaderInsert = 1

endfunction

function! Update_date()
    
	" Mise à jour de la date de dernière modofication seulement si header initialise

	update
	let g:date_update = strftime('%d/%m/%Y %H:%M:%S')
	if &filetype != "sh" | call setline('9', "/*   Updated: " . g:date_update . " by " . g:username . "       ###   ########.lu       */") | endif
	if &filetype == "sh" | call setline('9', "#    Updated: " . g:date_update . " by " . g:username . "       ###   ########.lu        #") | endif

endfunction

function! InsertSpaceForHeader()

    " Decale le corps du texte pour inserer un header

	let save_cursor = getpos(".")
	call cursor(1,1)
	call append(1,repeat([''],12))
	call InsertHeader_C()
	call setpos(".", save_cursor)

endfunction
