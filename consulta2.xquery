xquery version "3.1";

for $socio in doc("/db/coleccion/socios_gim.xml")/SOCIOS_GIM/fila_socios
let $codigosocio := $socio/COD
let $suma_adic := sum(doc("resultado.xml")//datos[CODSOCIO = $codigosocio]/CUOTA_ADICIONAL)


return  <data>
            <COD>
                {data($codigosocio)}
            </COD>
            <NOMBRESOCIO>
               {$socio/NOMBRE/text()}
            </NOMBRESOCIO>
            <CUOTAFIJA>
                {data($socio/CUOTA_FIJA)}
            </CUOTAFIJA>
            <suma_cuota_adic>
                { data($suma_adic) }
            </suma_cuota_adic>
            <cuota_total>
                {data($suma_adic + $socio/CUOTA_FIJA)}
            </cuota_total>
        </data>