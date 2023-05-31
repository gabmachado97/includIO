# import winshell

# # Get the recycle bin object
# recycle_bin = winshell.recycle_bin()
# listFiles = []
# # Iterate over the items in the recycle bin
# for item in recycle_bin:
#     original_path = item.original_filename()  # Original path of the file before deletion
#     file_name = item.name  # File name
#     listFiles.append(original_path)

#     #Open to write
#     datFile = open("./list.txt", "w")
#     datFile.write(str(listFiles))
#     datFile.close()
    
### Clear Output Files that are unecessary
import os
import shutil
listToDelete = ['./output/inputIO/PySide6/translations/qtdeclarative_hr.qm', 
'./output/inputIO/PySide6/Qt6QuickTest.dll', 
'./output/inputIO/PySide6/plugins/platforms/qdirect2d.dll', 
'./output/inputIO/PySide6/Qt63DQuickInput.dll', 
'./output/inputIO/PySide6/opengl32sw.dll', 
'./output/inputIO/PySide6/Qt63DLogic.dll',
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_messages.dll', 
'./output/inputIO/PySide6/qml/Qt3D', 
'./output/inputIO/PySide6/Qt63DQuickRender.dll', 
'./output/inputIO/shiboken6/MSVCP140.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_sk.qm', 
'./output/inputIO/PySide6/Qt6WebChannel.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_de.qm', 
'./output/inputIO/PySide6/Qt6OpenGLWidgets.dll',
'./output/inputIO/PySide6/Qt6Widgets.dll',
'./output/inputIO/PySide6/plugins/qmltooling', 
'./output/inputIO/PySide6/translations/qtbase_cs.qm', 
'./output/inputIO/PySide6/qml/QtPositioning', 
'./output/inputIO/PySide6/qml/QtRemoteObjects', 
'./output/inputIO/PySide6/Qt6ScxmlQml.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_pl.qm', 
'./output/inputIO/unicodedata.pyd', 
'./output/inputIO/PySide6/Qt6VirtualKeyboard.dll',
'./output/inputIO/PySide6/Qt6Quick3DParticleEffects.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_fa.qm',
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_native.dll',
'./output/inputIO/PySide6/Qt6QuickShapes.dll', 
'./output/inputIO/PySide6/Qt6WebEngineQuick.dll',
'./output/inputIO/PySide6/translations/qtbase_hu.qm',
'./output/inputIO/PySide6/translations/qtbase_ar.qm', 
'./output/inputIO/PySide6/translations/qtdeclarative_uk.qm', 
'./output/inputIO/PySide6/qml/QtWebSockets', 
'./output/inputIO/PySide6/translations/qtdeclarative_lv.qm', 
'./output/inputIO/PySide6/qml/QtQml/plugins.qmltypes',
'./output/inputIO/PySide6/Qt63DAnimation.dll', 
'./output/inputIO/PySide6/translations/qtbase_nn.qm', 
'./output/inputIO/PySide6/translations/qtbase_lv.qm', 
'./output/inputIO/PySide6/translations/qtbase_de.qm',
'./output/inputIO/PySide6/Qt6Sensors.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_ru.qm', 
'./output/inputIO/PySide6/translations/qtbase_ja.qm',
'./output/inputIO/PySide6/translations/qtdeclarative_bg.qm', 
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_quick3dprofiler.dll',
'./output/inputIO/PySide6/Qt6MultimediaQuick.dll', 
'./output/inputIO/PySide6/qml/QtQml/XmlListModel', 
'./output/inputIO/PySide6/qml/QtQuick3D', 
'./output/inputIO/PySide6/Qt6Scxml.dll', 
'./output/inputIO/PySide6/translations/qtbase_da.qm', 
'./output/inputIO/PySide6/translations/qtdeclarative_ja.qm', 
'./output/inputIO/PySide6/translations/qtdeclarative_hu.qm', 
'./output/inputIO/PySide6/translations/qtbase_it.qm', 
'./output/inputIO/PySide6/Qt6LabsQmlModels.dll',
'./output/inputIO/PySide6/translations/qtdeclarative_da.qm', 
'./output/inputIO/PySide6/qml/QtMultimedia', 
'./output/inputIO/PySide6/Qt6RemoteObjects.dll',
'./output/inputIO/PySide6/translations/qtbase_fr.qm', 
'./output/inputIO/PySide6/qml/QtDataVisualization', './output/inputIO/PySide6/Qt63DExtras.dll', 
'./output/inputIO/PySide6/qml/QtCharts', 
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_debugger.dll',
'./output/inputIO/PySide6/qml/QtTest', 
'./output/inputIO/PySide6/Qt6QuickTimeline.dll',
'./output/inputIO/PySide6/Qt6WebEngineCore.dll', 
'./output/inputIO/PySide6/Qt6Sql.dll', 
'./output/inputIO/PySide6/Qt6LabsWavefrontMesh.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_fi.qm',
'./output/inputIO/PySide6/Qt63DInput.dll', 
'./output/inputIO/PySide6/translations/qtbase_es.qm',
'./output/inputIO/PySide6/Qt6Pdf.dll', 
'./output/inputIO/PySide6/Qt6Concurrent.dll', 
'./output/inputIO/PySide6/plugins/tls', 
'./output/inputIO/PySide6/Qt6Charts.dll', 
'./output/inputIO/PySide6/Qt6ChartsQml.dll', 
'./output/inputIO/libssl-1_1.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_nn.qm', 
'./output/inputIO/PySide6/Qt6Quick3DRuntimeRender.dll', 
'./output/inputIO/PySide6/translations/qtbase_hr.qm',
'./output/inputIO/PySide6/translations/qtdeclarative_es.qm',
'./output/inputIO/PySide6/translations/qtbase_ko.qm', 
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_quickprofiler.dll', 
'./output/inputIO/PySide6/Qt6QuickLayouts.dll',
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_inspector.dll', 
'./output/inputIO/PySide6/translations/qtbase_uk.qm',
'./output/inputIO/PySide6/Qt6Multimedia.dll',
'./output/inputIO/PySide6/translations/qtdeclarative_ca.qm',
'./output/inputIO/PySide6/translations/qtbase_sk.qm', 
'./output/inputIO/PySide6/Qt6QmlXmlListModel.dll', 
'./output/inputIO/PySide6/Qt6Positioning.dll',
'./output/inputIO/PySide6/Qt6LabsSharedImage.dll', 
'./output/inputIO/PySide6/Qt6QuickParticles.dll',
'./output/inputIO/PySide6/Qt6DataVisualizationQml.dll', 
'./output/inputIO/PySide6/Qt63DQuickScene2D.dll',
'./output/inputIO/PySide6/translations/qtbase_pl.qm', 
'./output/inputIO/PySide6/translations/qtdeclarative_ko.qm', 
'./output/inputIO/PySide6/translations/qtbase_gd.qm', 
'./output/inputIO/PySide6/Qt6Quick3DAssetImport.dll',
'./output/inputIO/PySide6/Qt63DCore.dll', 
'./output/inputIO/PySide6/Qt6DataVisualization.dll',
'./output/inputIO/PySide6/Qt6Quick3D.dll',
'./output/inputIO/PySide6/translations/qtbase_he.qm',
'./output/inputIO/PySide6/Qt6LabsFolderListModel.dll', 
'./output/inputIO/PySide6/translations/qtbase_tr.qm',
'./output/inputIO/PySide6/qml/QtWebChannel',
'./output/inputIO/PySide6/Qt63DQuick.dll', 
'./output/inputIO/PySide6/Qt6LabsAnimation.dll', 
'./output/inputIO/PySide6/Qt6RemoteObjectsQml.dll',
'./output/inputIO/PySide6/translations/qtbase_ru.qm',
'./output/inputIO/PySide6/translations/qtbase_fa.qm',
'./output/inputIO/PySide6/Qt6SensorsQuick.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_ar.qm', 
'./output/inputIO/PySide6/translations/qtbase_nl.qm',
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_local.dll', 
'./output/inputIO/PySide6/Qt6LabsSettings.dll', 
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_tcp.dll', 
'./output/inputIO/PySide6/Qt6Quick3DParticles.dll', 
'./output/inputIO/PySide6/qml/QtWebEngine',
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_profiler.dll', 
'./output/inputIO/libcrypto-1_1.dll',
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_nativedebugger.dll', './output/inputIO/PySide6/translations/qtbase_fi.qm',
'./output/inputIO/PySide6/translations/qtdeclarative_zh_TW.qm', 
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_server.dll', 
'./output/inputIO/PySide6/Qt6WebEngineQuickDelegatesQml.dll', 
'./output/inputIO/PySide6/Qt6PositioningQuick.dll',
'./output/inputIO/PySide6/Qt6WebSockets.dll',
'./output/inputIO/PySide6/translations/qtdeclarative_nl.qm',
'./output/inputIO/PySide6/Qt6Quick3DUtils.dll', 
'./output/inputIO/PySide6/Qt63DQuickExtras.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_tr.qm', 
'./output/inputIO/PySide6/Qt6QmlLocalStorage.dll', 
'./output/inputIO/PySide6/Qt6Quick3DAssetUtils.dll', 
'./output/inputIO/PySide6/translations/qtdeclarative_fr.qm', 
'./output/inputIO/PySide6/Qt6Quick3DEffects.dll', 
'./output/inputIO/PySide6/qml/QtScxml', 
'./output/inputIO/PySide6/translations/qtbase_zh_CN.qm', 
'./output/inputIO/PySide6/translations/qtbase_zh_TW.qm', 
'./output/inputIO/PySide6/translations/qtbase_bg.qm',
'./output/inputIO/PySide6/translations/qtbase_ca.qm', 
'./output/inputIO/PySide6/qml/QtSensors', 
'./output/inputIO/PySide6/translations/qtdeclarative_zh_CN.qm', 
'./output/inputIO/PySide6/Qt6Quick3DHelpers.dll', 
'./output/inputIO/PySide6/plugins/qmltooling/qmldbg_preview.dll', 
'./output/inputIO/PySide6/Qt63DRender.dll', 
'./output/inputIO/PySide6/Qt6Test.dll', 
'./output/inputIO/PySide6/Qt3D', 
'./output/inputIO/PySide6/QtCharts', 
'./output/inputIO/PySide6/QtDataVisualization', 
'./output/inputIO/PySide6/QtMultimedia', 
'./output/inputIO/PySide6/QtPositioning', 
'./output/inputIO/PySide6/QtQuick3D', 
'./output/inputIO/PySide6/QtRemoteObjects', 
'./output/inputIO/PySide6/QtScxml', 
'./output/inputIO/PySide6/QtTest', 
'./output/inputIO/PySide6/QtSensors', 
'./output/inputIO/PySide6/QtWebChannel', 
'./output/inputIO/PySide6/QtWebEngine', 
'./output/inputIO/PySide6/QtWebSockets', 
'./output/inputIO/PySide6/Qt63DQuickAnimation.dll']


for item in listToDelete:
    if os.path.isfile(item):  # Check if the item is a file
        os.remove(item)  # Delete the file
        print("Deleted file:", item)
    elif os.path.isdir(item):  # Check if the item is a directory
         # Delete the empty directory
        #print(item)
        shutil.rmtree(item, ignore_errors=True)
        print("Deleted directory:", item)
    else:
        print("Invalid item:", item)
