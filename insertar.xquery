(:xquery version "3.1";:)
(:update insert:)
(:<fila_socios>:)
(:   <COD>10</COD>:)
(:   <NOMBRE>XABI</NOMBRE>:)
(:   <FECHA_ALT>08/02/09</FECHA_ALT>:)
(:   <DIRECCION>VITORIA</DIRECCION>:)
(:   <CUOTA_FIJA>100</CUOTA_FIJA>:)
(:</fila_socios>:)

(:    into /SOCIOS_GIM:)

(:xquery version "3.1";:)
(:update insert:)
(:   <fila_socios>:)
(:      <COD>1</COD>:)
(:      <NOMBRE>XABIER</NOMBRE>:)
(:      <FECHA_ALT>08/02/09</FECHA_ALT>:)
(:      <DIRECCION>VITORIA</DIRECCION>:)
(:      <CUOTA_FIJA>100</CUOTA_FIJA>:)
(:   </fila_socios>:)

(:preceding /SOCIOS_GIM/fila_socios[COD=10]:)



xquery version "3.1";
update insert
   <fila_socios>
      <COD>1</COD>
      <NOMBRE>XABIER</NOMBRE>
      <FECHA_ALT>08/02/09</FECHA_ALT>
      <DIRECCION>VITORIA</DIRECCION>
      <CUOTA_FIJA>100</CUOTA_FIJA>
   </fila_socios>

preceding /SOCIOS_GIM/fila_socios[COD=10]

