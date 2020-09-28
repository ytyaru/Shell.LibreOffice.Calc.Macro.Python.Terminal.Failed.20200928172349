#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# LibreOffice CalcのPythonマクロをsofficeコマンドで実行できないパターン
# CreatedAt: 2020-09-28
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	mkdir -p ~/.config/libreoffice/4/user/Scripts/python
	cp ./hello_msgbox.py ~/.config/libreoffice/4/user/Scripts/python

	soffice macro:///Standard.hello_msgbox.hello
	soffice macro:///hello_msgbox.hello_msgbox.hello
	soffice macro:///hello_msgbox.hello
	soffice macro:///MyMacro.hello_msgbox.hello
	soffice macro:///mymacro.hello_msgbox.hello
	soffice macro:///Mymacro.hello_msgbox.hello
	soffice macro:///myMacro.hello_msgbox.hello
	soffice macro:///マイマクロ.hello_msgbox.hello

	soffice 'vnd.sun.star.script:hello_msbgox.py$hello?language=Python&location=user'
}
Run "$@"
