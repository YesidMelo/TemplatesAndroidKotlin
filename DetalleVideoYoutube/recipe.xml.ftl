<?xml version="1.0"?>
<recipe>
	<merge from="manifest/AndroidManifest.xml.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
				 
	<merge from="gradle/build.gradle.ftl"
				to="${escapeXmlAttribute(projectOut)}/build.gradle" />
	
	<merge 
		from = "res/values/dimens.xml.ftl" 
		to="${escapeXmlAttribute(resOut)}/values/dimens.xml"
	/>
	<merge 
		from = "res/values/strings.xml.ftl" 
		to="${escapeXmlAttribute(resOut)}/values/strings.xml"
	/>
	
	## Manejador Clases
	<instantiate from="logica/DetalleVideoYoutube.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/UtilidadesVista/PrevisualizadorVideosYoutube/utilidades_visualizador_youtube/DetalleVideoYoutube.kt"/>
	<instantiate from="logica/ProxyYoutube.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/UtilidadesVista/PrevisualizadorVideosYoutube/utilidades_visualizador_youtube/ProxyYoutube.kt"/>
	<instantiate from="logica/VistaPrevisualizadorVideosYoutube.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/UtilidadesVista/PrevisualizadorVideosYoutube/VistaPrevisualizadorVideosYoutube.kt"/>
	<instantiate from="res/layout/vista_previsualizador_videos_youtube.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/vista_previsualizador_videos_youtube.xml"/>


</recipe>
