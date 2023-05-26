# Code to manage the includes written in the root folder of dat files

import os

path_test = r'C:\Users\machadog\Desktop\WEG\PYTHON PROJECTS\remover_dats\dados'
path_remove = 'at01'

def removeInclude(rootPath, uFolderName):
    '''
    Function to remove include from root folder
    '''
    includePath = rootPath + '/' + uFolderName
    if not os.path.isdir(rootPath):
        raise ValueError("Caminho para pasta raíz não encontrado!")
    elif not os.path.isdir(includePath):
        raise ValueError("Pasta de include não encontrada na pasta raíz!")
    else:
        includeFiles = [f for f in os.listdir(includePath) if f.endswith('.dat')]
        print(includeFiles)

        #Loop over files in include to remove it from root folder
        for file in includeFiles:
            fileRootPath = rootPath + '/' + file
            if os.path.exists(fileRootPath):
                datFile = open(fileRootPath,"r")
                newContent = ""
                for line in datFile:
                    line = line.strip()
                    if not '/'+uFolderName+'/' in line:
                        #Add to the new content only if it does not contains the folder we want to remove from #include
                        newContent = newContent + line + "\n"
                datFile.close()

                #Open to write
                datFile = open(fileRootPath, "w")
                datFile.write(newContent)
                datFile.close()
                    

def addInclude(rootPath, uFolderName):
    '''
    Function to add include from root folder
    '''
    includePath = rootPath + '/' + uFolderName
    if not os.path.isdir(rootPath):
        raise ValueError("Caminho para pasta raíz não encontrado!")
    elif not os.path.isdir(includePath):
        raise ValueError("Pasta de include não encontrada na pasta raíz!")
    else:
        includeFiles = [f for f in os.listdir(includePath) if f.endswith('.dat')]
        print(includeFiles)

        #Loop over files in include to remove it from root folder
        for file in includeFiles:
            fileRootPath = rootPath + '/' + file
            if os.path.exists(fileRootPath):
                datFile = open(fileRootPath,"r")
                newContent = ""
                alreadyInInclude = False
                for line in datFile:
                    line = line.strip()
                    if (('/'+uFolderName+'/' in line) and (not line.startswith(';'))):
                        #If it has uFolderName and is not a comment, then the include is already included and do nothing
                        alreadyInInclude = True
                    else:
                        newContent = newContent + line + "\n"

                #After finished, we add the new include
                newInclude = '#include ./' + uFolderName + "/" + file + "\n"
                newContent = newInclude + newContent
                datFile.close()

                #Open to write
                datFile = open(fileRootPath, "w")
                datFile.write(newContent)
                datFile.close()                 
                


try:
    removeInclude(path_test, path_remove)
except ValueError as e:
    print(e)


def UpdateInclude(pathFolder, folderToUpdate, addInclude):

    if os.path.isdir(pathFolder + folderToUpdate):
        # if youre gonna add, its gonna verify the destiny's folder to seek all the existing .dat
        listFiles = [f for f in os.listdir(pathFolder + folderToUpdate) if f.endswith('.dat')]
        print(listFiles)

    for fileName in os.listdir(pathFolder):
        foundInclude = False
        if fileName.endswith('.dat'):
            #loop every line
            datFile = open(os.path.join(pathFolder,fileName),"r")
            replaced_content = ""
            for line in datFile:
                line = line.strip()
                if ("#include" in line) and (folderToUpdate in line):

                    if addInclude:
                        foundInclude = True
                        new_line = line.replace(";", "")
                        print ("Include adicionado: " + folderToUpdate + " em " + fileName)
                    else:
                        foundInclude = True
                        new_line = ";" + line
                        print("Include removido: " + folderToUpdate + " em " + fileName)
                else:
                    new_line = line

                replaced_content = replaced_content + new_line + "\n"

            if addInclude:
                # Há o arquivo na pasta de destino, mas não há o include na raiz, entao adiciona
                if any(dat in fileName for dat in listFiles) and (foundInclude == False):
                    print("Include de: " + folderToUpdate + " não encontrado em " + fileName)
                    replaced_content = "#include " + folderToUpdate + fileName + "\n" + replaced_content
                    print("Include de: " + folderToUpdate + " adicionado em " + fileName)
            else:
                # Não há o arquivo na pasta de destino, mas há o include na raiz, entao deleta include
                if not (any(dat in fileName for dat in listFiles)) and (foundInclude == True):
                    print("Include de: " + folderToUpdate + " encontrado em " + fileName)
                    #replaced_content = "#include " + folderToUpdate + fileName + "\n" + replaced_content
                    test = replaced_content.split("\n")
                    replaced_content = [x for x in test if (folderToUpdate + fileName) not in x]
                    replaced_content = '\n'.join(replaced_content)
                    print("Include de: " + folderToUpdate + " removido em " + fileName)
            datFile.close()

            writeFile = open(os.path.join(pathFolder, fileName), "w")
            writeFile.write(replaced_content)
            writeFile.close()







# if __name__ == '__main__':
#     pathFolder = './dados/'
#     folderToEdit = "2Ktest/"



#     # Pass False to remove include and True to add include
#     # Folder that are the dats, folder we want include
#     UpdateInclude(pathFolder, folderToEdit, True)

