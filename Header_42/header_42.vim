function! InsertHeader()

    " formatage de la ligne 3 avec le nom du fichier courant

    let line3 = "/*      g:filename                                        :::      ::::::::    */"
    let length_var_filename = strlen(g:filename)
    let space_need_line3 = 80 - 31 - length_var_filename
    let spaces_line3 = repeat(' ', space_need_line3)
    let formated_line3 = strpart(line3, 0, 8) . g:filename . spaces_line3 . strpart(line3, 58, 80)

    " formatage de la ligne 6 avec le nom du proprietaire et son adresse mail

    let line6 = "/*      by: g:username  g:email                     +#+  +:+       +#+         */"
    let length_var_username = strlen(g:username)
    let length_var_mail = strlen(g:email)
    let space_need_line6 = 80 - 41 - length_var_username - length_var_mail
    let spaces_line6 = repeat(' ', space_need_line6)
    let formated_line6 = strpart(line6, 0,12) . g:username . g:email . spaces_line6 . strpart(line6, 52, 80) 

    " Création du header

    call setline('1', "/* ************************************************************************** */")
    call setline('2', "/*                                                                            */")
    call setline('3', formated_line3)
    call setline('4', "/*                                                     :+:      :+:    :+:    */")
    call setline('5', "/*                                                   +:+ +:+         :+:      */")
    call setline('6', formated_line6)
    call setline('7', "/*                                               +#+#+#+#+#+   +#+            */")
    call setline('8', "/*      Created: " . g:date_born . "                   #+#   #+#              */")
    call setline('9', "/*      Updated: " . g:date_update . "                  ###   ########.lu       */")
    call setline('10', "/*                                                                            */")
    call setline('11', "/* ************************************************************************** */")
    call setline('12', "")
    autocmd BufReadPost * 12
    autocmd BufWinEnter * call cursor (13,1)

    let g:HeaderInsert = 1

endfunction

function! Update_date()
    
    " Mise à jour de la date de dernière modofication seulement si header initialise

    update
    let g:date_update = strftime('%d/%m/%Y %H:%M:%S')
    call setline('9', "/*      Updated: " . g:date_update . "                  ###   ########.lu       */")

endfunction

function! InsertSpaceForHeader()

    " Decale le corps du texte pour inserer un header
    
    let save_cursor = getpos(".")
    call cursor(1,1)
    call append(1,repeat([''],12))
    call InsertHeader()
    call setpos(".", save_cursor)

endfunction

