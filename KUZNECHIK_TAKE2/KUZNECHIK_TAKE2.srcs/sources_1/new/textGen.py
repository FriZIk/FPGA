inpFile = open("text.txt", "r")
outFile = open("resText.txt", "w")

while True:
    numbors = []
    fromNum = ""
    for i in range(0, 9):
        #7th
        inpLine = inpFile.readline()
        print("HERE ", inpLine)
        pos = inpLine.find("'")
        if i == 0:
            inipos = inpLine.find('when ')
            fromNum = inpLine[(inipos+6):inipos+6+8]
            continue
        numbors.append(inpLine[pos+1])

    #outFile.write("\twhen \"" + fromNum +"\" =>\n\tresult(0 to 7) <= b\"" + "".join(numbors) + "\";\n")
    outFile.write("" + str(int(fromNum, 2))+", ")