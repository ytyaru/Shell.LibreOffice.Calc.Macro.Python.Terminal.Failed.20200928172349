#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# https://qiita.com/ty21ky/items/eb4bdb71570d1866b35f
import uno
class Bridge(object):
    def __init__(self):
        self._context = XSCRIPTCONTEXT.getComponentContext()
        self._desktop = XSCRIPTCONTEXT.getDesktop()
        self._frame = self._desktop.CurrentFrame
        self._window = self._frame.ContainerWindow
        self._toolkit = self._window.Toolkit
    def run_infodialog(self, title='', message=''):
        msgbox = self._toolkit.createMessageBox(self._window,
                                                'infobox',
                                                1,
                                                title,
                                                message)
        msgbox.execute()
        msgbox.dispose()

def hello():
    pyuno = Bridge()
    pyuno.run_infodialog(title='Hello MessageBox', message='LibreOfficeのPythonマクロによる\nメッセージボックス表示テストです。')

g_exportedScripts = (hello,)
