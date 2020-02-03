xquery version "3.1";

for $herramienta in collection("/db/coleccion/")//USO_GIMNASIO/fila_uso
    let $NOMBRE := /SOCIOS_GIM/fila_socios[COD=$herramienta/CODSOCIO ]/NOMBRE
    let $NOMBREACT := /ACTIVIDADES_GIM/fila_actividades[@cod=$herramienta/CODACTIV]/NOMBRE
    let $HORAS :=$herramienta/HORAFINAL -  $herramienta/HORAINICIO
    let $tipo := /ACTIVIDADES_GIM/fila_actividades[@cod=$herramienta/CODACTIV]/@tipo

    return
        <datos>
            {$herramienta/CODSOCIO}
            <NOMBRESOCIO>{$NOMBRE/text()}</NOMBRESOCIO>
            <CODACTIV>{$herramienta/CODACTIV/text()}</CODACTIV>
            <NOMBREACTIVIDAD>{$NOMBREACT/text()}</NOMBREACTIVIDAD>
            <HORAS>{$HORAS}</HORAS>
            <TIPOACT>{data($tipo)}</TIPOACT>
            <CUOTA_ADICIONAL>{
                if ($tipo = 1)then
                    "0"
                else
                    if ($tipo = 2)then
                        $HORAS * 2
                    else
                        $HORAS * 4
           }
            </CUOTA_ADICIONAL>
        </datos>

