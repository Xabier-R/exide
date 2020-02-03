from pyexistdb import db


class Ejercicio:



    @staticmethod
    def cargarDatos():


        conex=db.ExistDB("http://admin:dm2@localhost:8080/exist")


        if conex.hasCollection("coleccion"):
            print("encontrado")
        else:
            conex.createCollection("coleccion")
            print("creada")

        with open('actividades_gim.xml', 'r')as file1:
            archivo1 = file1.read()

        with open('socios_gim.xml', 'r')as file2:
            archivo2 = file2.read()

        with open('uso_gimnasio.xml', 'r')as file3:
            archivo3 = file3.read()

        with open('consulta1.xquery', 'r')as file4:
            consulta = file4.read()

        with open('consulta2.xquery', 'r')as file5:
            consulta2 = file5.read()

        conex.load(archivo1, "/db/coleccion/actividades_gim.xml")
        conex.load(archivo2, "/db/coleccion/socios_gim.xml")
        conex.load(archivo3, "/db/coleccion/uso_gimnasio.xml")

        resultID = conex.executeQuery(consulta)

        num = conex.getHits(resultID)

        result = ""

        for pos in range(0, num):

            result += conex.retrieve_text(resultID, pos)

        conex.load("<resultado>"+result+"</resultado>", "/db/coleccion/resultado.xml")



        resultID = conex.executeQuery(consulta2)

        num = conex.getHits(resultID)

        result = ""

        for pos in range(0, num):
            result += conex.retrieve_text(resultID, pos)

        conex.load("<resultado2>" + result + "</resultado2>", "/db/coleccion/resultado2.xml")




    @staticmethod
    def pruebaINSERT():

        conex = db.ExistDB("http://admin:dm2@localhost:8080/exist")

        with open('insertar.xquery', 'r')as file:
            archivo = file.read()

        conex.executeQuery(archivo)



    @staticmethod
    def pruebaREPLACE():

        conex = db.ExistDB("http://admin:dm2@localhost:8080/exist")

        with open('replace.xquery', 'r')as file:
            archivo = file.read()

        conex.executeQuery(archivo)

    @staticmethod
    def pruebaVALUE():

        conex = db.ExistDB("http://admin:dm2@localhost:8080/exist")

        with open('value.xquery', 'r')as file:
            archivo = file.read()

        conex.executeQuery(archivo)

    @staticmethod
    def pruebaDELETE():

        conex = db.ExistDB("http://admin:dm2@localhost:8080/exist")

        with open('delete.xquery', 'r')as file:
            archivo = file.read()

        conex.executeQuery(archivo)

    @staticmethod
    def pruebaRENAME():

        conex = db.ExistDB("http://admin:dm2@localhost:8080/exist")

        with open('rename.xquery', 'r')as file:
            archivo = file.read()

        conex.executeQuery(archivo)



    @staticmethod
    def menu():
        """Metodo para la ejecucion del menu del programa"""

        resp = 9
        while (resp != 0):
            print("""
    1. Cargar datos 
    2. INSERT
    3. REPLACE
    4. VALUE
    5. DELETE    
    6. RENAME
    
    
    0. Salir""")

            resp = int(input())
            Ej = Ejercicio()
            if (resp == 1):
                Ej.cargarDatos()

            elif (resp == 2):
                Ej.pruebaINSERT()

            elif (resp == 3):
                Ej.pruebaREPLACE()

            elif (resp == 4):
                Ej.pruebaVALUE()

            elif (resp == 5):
                Ej.pruebaDELETE()

            elif (resp == 6):
                Ej.pruebaRENAME()


Ej = Ejercicio()
Ej.menu()
