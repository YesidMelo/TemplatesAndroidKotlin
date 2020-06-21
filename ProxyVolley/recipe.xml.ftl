<?xml version="1.0"?>
<recipe>
	<merge from="manifiest/AndroidManifest.xml.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	<merge from="gradle/build.gradle.ftl"
				to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    
## Manejador Manifiest	
<copy 
	from = "libs/okhttp-urlconnection-2.2.0.jar" 
	to = "${escapeXmlAttribute(projectOut)}/libs/okhttp-urlconnection-2.2.0.jar" />

## manejador strings
<merge 
	from = "values/string.xml.ftl" 
	to="${escapeXmlAttribute(resOut)}/values/strings.xml"
	/>
## Manejador clases
## Manejador Modelos
<instantiate from="logica/MensajeError.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Modelos/ProxyVolley/MensajeError.kt"/>
<instantiate from="logica/UsuarioToken.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Modelos/ProxyVolley/UsuarioToken.kt"/>

## Manejador Utilidades
<instantiate from="utilidades/Servicios.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Utilidades/ProxyVolley/Servicios.kt"/>
<instantiate from="utilidades/IdentificadorSharedPreferences.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Utilidades/ProxyVolley/IdentificadorSharedPreferences.kt"/>

## Manejador DataAccess
<instantiate from="logica/EscuchadorRespuestaVolley.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/EscuchadorRespuestaVolley.kt"/>
<instantiate from="logica/ErrorResponseVolley.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/ErrorResponseVolley.kt"/>
<instantiate from="logica/Metodo.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/Metodo.kt"/>
<instantiate from="logica/NukeSSLCerts.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/NukeSSLCerts.kt"/>
<instantiate from="logica/ProxyVolley.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/ProxyVolley.kt"/>
<instantiate from="logica/PreferenciasServidor.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/PreferenciasServidor.kt"/>
<instantiate from="logica/ManejadorDeCabezerasDePeticiones.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ProxyVolley/ManejadorDeCabezerasDePeticiones.kt"/>

## <!-- <instantiate from="logica/ManejadorDeCabezerasDePeticiones.kt.ftl" to="${escapeXmlAttribute(srcOut)}/DataAccess/ManejadorDeCabezerasDePeticiones.kt"/> -->


</recipe>
