function! InsertHeader()

    " formatage de la ligne 15 avec le nom du fichier courant

    let line15 = "/*  File: g:filename                                                                                    */"
    let length_var_filename = strlen(g:filename)
    let space_need_line15 = 106 - 12 - length_var_filename
    let spaces_line15 = repeat(' ', space_need_line15)
    let formated_line15 = strpart(line15, 0, 10) . g:filename . spaces_line15 . strpart(line15, 104, 106)

    " formatage de la ligne 17 avec le nom du proprietaire et son adresse mail

    let line17 = "/*  By: g:username g:email                                                                              */"
    let length_var_username = strlen(g:username)
    let length_var_mail = strlen(g:email)
    let space_need_line17 = 106 - 10 - length_var_username - length_var_mail
    let spaces_line17 = repeat(' ', space_need_line17)
    let formated_line17 = strpart(line17, 0,8) . g:username . g:email . spaces_line17 . strpart(line17, 104, 106) 

    " Création du header

    call setline('1', "/* **************************************************************************************************** */")
    call setline('2', "/*                                                                                                      */")
    call setline('3', "/*  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  */")
    call setline('4', "/*                                                   :::                                                */")
    call setline('5', "/*  :::      :::  :::  ::::::::  ::::::::  ::::::::  :::  :::::::    ::::::::  :::      :::  :::::::::  */")
    call setline('6', "/*  :+:\\\\    :+:  :+:  :+:       :+:  :+:  :+:  :+:  :+:  :+:  :+:   :+:  :+:  :+:\\\\    :+:  :+:   :+:  */")
    call setline('7', "/*  +:+ \\\\   +:+  +:+  +:+       +:+  +:+  +:+       +:+  +:+   +:+  +:+  +:+  +:+ \\\\   +:+  +:+   +:+  */")
    call setline('8', "/*  +#+  \\\\  +#+  +:+  +:+       +:+  +:+  +:+:+:+:  +:+  +:+ +:+    +:+  +:+  +#+  \\\\  +#+  +#+   #+#  */")
    call setline('9', "/*  +#+   \\\\ +#+  +#+  +#+       +#+  +#+       +#+  +#+  +#+#+#+    +#+  +#+  +#+   \\\\ +#+  +#+#+#+#+  */")
    call setline('10', "/*  #+#    \\\\#+#  #+#  #+#       #+#  #+#  #+#  #+#  #+#  #+#  #+#   #+#  #+#  #+#    \\\\#+#        #+#  */")
    call setline('11', "/*  ###      ###  ###  ########  ########  ########  ###  ###   ###  ########  ###      ###        ###  */")
    call setline('12', "/*                                                                                                ###   */")
    call setline('13', "/*  ################################################################################################    */")
    call setline('14', "/*                                                                                                      */")
    call setline('15', formated_line15)
    call setline('16', "/*                                                                                                      */")
    call setline('17', formated_line17)
    call setline('18', "/*                                                                                                      */")
    call setline('19', "/*  Created : " . g:date_born . "                                                                       */")
    call setline('20', "/*  Updated : " . g:date_update . "                                                                       */")
    call setline('21', "/*                                                                                                      */")
    call setline('22', "/* **************************************************************************************************** */")
    call setline('23', "")

    autocmd BufReadPost * 23
    autocmd BufWinEnter * call cursor (23,1)

    let g:HeaderInsert = 1

endfunction

function! Update_date()
    
    " Mise à jour de la date de dernière modofication seulement si header initialise

    update
    let g:date_update = strftime('%d/%m/%Y %H:%M:%S')
    call setline('20', "/*  Updated : " .g:date_update . "                                                                       */")

endfunction

function! InsertSpaceForHeader()

    " Decale le corps du texte pour inserer un header
    
    let save_cursor = getpos(".")
    call cursor(1,1)
    call append(1,repeat([''],23))
    call InsertHeader()
    call setpos(".", save_cursor)

endfunction













