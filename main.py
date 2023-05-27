from PySide6.QtCore import *
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

import sys
import os

from python.manager import * #import TreeViewOrganizer



class Bridge(QObject):
    def __init__(self, data):
        QObject.__init__(self)
        self.data = data
        #self.refresh()

    # def refresh(self):
    #     self.dbModels = DashboardModel(self.data)

    # receivedIED     = Signal(str)
    # linkVGeralModel = Signal(list)
    # linkDBModel     = Signal(list)
    # linkDSetModel     = Signal(list)
    # linkInOutDraw     = Signal(list)

    # @Slot(str)
    # def setTitle(self, iedName):
    #     self.receivedIED.emit(iedName)

    # @Slot(str)
    # def setModel(self, iedName):
    #     #Gather the points available for the selected IED
    #     for scd in self.data:
    #         for ied in scd['ieds']:
    #             ied_name = ied['name']
    #             if iedName == ied_name:
    #                 #Visao Geral model
    #                 modelVGeral = self.dbModels.mountVGeral(iedName)
    #                 self.linkVGeralModel.emit(modelVGeral)
    #                 #Tabular model
    #                 # modelToSend = self.data[iedName]['points']
    #                 # self.linkDBModel.emit(modelToSend)
    #                 #Dataset model
    #                 modelDatSet = self.dbModels.mountDataSet(iedName)
    #                 self.linkDSetModel.emit(modelDatSet)
    #                 #Publish - > Subscribers model
    #                 modelPubSub = self.dbModels.getGooseInOut(iedName)
    #                 self.linkInOutDraw.emit(modelPubSub)
    #                 break

    #             # else:
    #             #     print("IED não encontrado.")
        

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    #Engine
    engine = QQmlApplicationEngine()
    context = engine.rootContext()

    #Bridge to interconnect QML and python
    pBrdige = Bridge("dataFile")


    #Main Bridge
    context.setContextProperty("qBridge", pBrdige)

    

    # engine.load(QUrl.fromLocalFile('main.qml'))
    engine.load(os.path.join(os.path.dirname(__file__), "./GUI/content/App.qml"))

    # Add the directory containing the custom components to the QML import path
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())