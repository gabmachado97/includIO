# Code to manage the includes written in the root folder of dat files

import os

# path_test = r'C:\Users\machadog\Desktop\WEG\PYTHON PROJECTS\remover_dats\dados'
# path_remove = 'at01'

def removeInclude(rootPath, uFolderName):
    '''
    Function to remove include from root folder
    '''
    includePath = rootPath + '/' + uFolderName
    if not os.path.isdir(rootPath):
        raise ValueError("Caminho para pasta raíz não encontrado!")
    elif not os.path.isdir(includePath) or uFolderName=='':
        raise ValueError("Pasta de include não encontrada na pasta raíz!")
    else:
        includeFiles = [f for f in os.listdir(includePath) if f.endswith('.dat')]
        
        output = ''
        #Loop over files in include to remove it from root folder
        for file in includeFiles:
            foundInclude = False
            output = output + "INFO: " + file + " encontrado na pasta do include \n"
            fileRootPath = rootPath + '/' + file
            if os.path.exists(fileRootPath):
                datFile = open(fileRootPath,"r")
                newContent = ""
                for line in datFile:
                    line = line.strip()
                    if (not '/'+uFolderName+'/' in line) and (not ' '+uFolderName+'/' in line):
                        #Add to the new content only if it does not contains the folder we want to remove from #include
                        newContent = newContent + line + "\n"
                    else:
                        foundInclude = True
                        output = output + "INFO: " + file + " removido da raíz \n"
                datFile.close()

                if not foundInclude:
                    output = output + "INFO: " + file + " já estava removido da raíz \n"

                #Open to write
                datFile = open(fileRootPath, "w")
                datFile.write(newContent)
                datFile.close()

            else:
                output = output + "ALERT: " + file + " não encontrado na raíz \n"
    return output                  

def addInclude(rootPath, uFolderName):
    '''
    Function to add include from root folder
    '''
    includePath = rootPath + '/' + uFolderName
    if not os.path.isdir(rootPath):
        raise ValueError("caminho para pasta raíz não encontrado!")
    elif not os.path.isdir(includePath) or uFolderName=='':
        raise ValueError("pasta de include não encontrada na raíz!")
    else:
        includeFiles = [f for f in os.listdir(includePath) if f.endswith('.dat')]
        

        output = ''
        #Loop over files in include to remove it from root folder
        for file in includeFiles:
            output = output + "INFO: " + file + " encontrado na pasta do include \n"
            fileRootPath = rootPath + '/' + file
            if os.path.exists(fileRootPath):
                datFile = open(fileRootPath,"r")
                newContent = ""
                alreadyInInclude = False
                for line in datFile:
                    line = line.strip()
                    if ((('/'+uFolderName+'/' in line)or(' '+uFolderName+'/' in line)) and (not line.startswith(';'))):
                        #If it has uFolderName and is not a comment, then the include is already included and do nothing
                        alreadyInInclude = True
                    else:
                        newContent = newContent + line + "\n"
                        

                #After finished, we add the new include
                newInclude = '#include ./' + uFolderName + "/" + file + "\n"
                newContent = newInclude + newContent
                if alreadyInInclude:
                    output = output + "INFO: " + file + " já estava adicionado na raíz \n"
                else:
                    output = output + "INFO: " + file + " adicionado na raíz \n"
                datFile.close()

                #Open to write
                datFile = open(fileRootPath, "w")
                datFile.write(newContent)
                datFile.close()     

            else:
                output = output + "ALERT: " + file + " não encontrado na raíz \n"            
    return output         


# try:
#     removeInclude(path_test, path_remove)
# except ValueError as e:
#     print(e)
