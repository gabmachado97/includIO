from PySide6.QtCore import Slot, Signal, QObject
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

import sys
import os

from content.python.manager import * #import TreeViewOrganizer

import inputio_rc


class Bridge(QObject):
    def __init__(self):
        QObject.__init__(self)

    output = Signal(str)
    log = Signal(str)

    @Slot(str, str)
    def add(self, rootPath, uFolder):
        if rootPath.startswith('file:///'):
            rootPath = rootPath.replace('file:///','')
        try:
            out = addInclude(rootPath, uFolder)
            self.output.emit("🤙 #include adicionado com sucesso!")
            self.log.emit(out)
        except ValueError as e:
            self.output.emit("👎 " + str(e))
            self.log.emit("Erro!")

    @Slot(str, str)
    def remove(self, rootPath, uFolder):
        if rootPath.startswith('file:///'):
            rootPath = rootPath.replace('file:///','')
        try:
            out = removeInclude(rootPath, uFolder)
            self.output.emit("🤙 #include removido com sucesso!")
            self.log.emit(out)
        except ValueError as e:
            self.output.emit("👎 " + str(e))
            self.log.emit("Erro!")


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    #Engine
    engine = QQmlApplicationEngine()
    context = engine.rootContext()

    #Bridge to interconnect QML and python
    pBridge = Bridge()

    #Main Bridge
    context.setContextProperty("qBridge", pBridge)

    engine.load("qrc:/resources/mainQml.qml")

    # Add the directory containing the custom components to the QML import path
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())