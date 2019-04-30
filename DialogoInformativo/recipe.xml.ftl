<?xml version="1.0"?>
<recipe>
	<!-- Clase -->
	<instantiate 
		from 	=	"codigo/DialogoInformativo.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/Componentes/Dialogos/DialogoInformativo.kt"
	/>

	<!-- Layout -->
	
	<instantiate 
		from 	=	"layout/dialogo_alerta.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/layout/dialogo_alerta.xml"
	/>

	<!-- Imagenes por defecto -->
	<instantiate 
		from 	=	"drawable/alerta.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/drawable/alerta.xml"
	/>
	
	<instantiate 
		from 	=	"drawable/error.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/drawable/error.xml"
	/>
	<instantiate 
		from 	=	"drawable/information.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/drawable/information.xml"
	/>
	<instantiate 
		from 	=	"drawable/ok.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/drawable/ok.xml"
	/>
	<instantiate 
		from 	=	"drawable/fondo_boton_dialogo.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/drawable/fondo_boton_dialogo.xml"
	/>

	<!-- estilos -->
	<merge 
		from 	=	"values/styles.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/values/styles.xml"
	/>

	<!-- Strings -->
	<merge 
		from 	=	"values/strings.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/values/strings.xml"
	/>

	<!-- colores -->
	<merge 
		from 	=	"values/colors.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/values/colors.xml"
	/>

	<instantiate 
		from 	=	"color/cambio_color_letra_botones_dialogo.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/color/cambio_color_letra_botones_dialogo.xml"
	/>

	<!-- dimenciones -->
	<merge 
		from 	=	"values/dimens.xml.ftl"
		to 		= 	"${escapeXmlAttribute(resOut)}/values/dimens.xml"
	/>

	<!-- gradle -->
	<merge 
		from 	=	"build.gradle.ftl"
		to 		= 	"${escapeXmlAttribute(projectOut)}/build.gradle"
	/>
</recipe>