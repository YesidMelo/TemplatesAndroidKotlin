<?xml version="1.0"?>
<recipe>
	<merge from="manifest/AndroidManifest.xml.ftl"
                 to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	<merge from="gradle/build.gradle.ftl"
				to="${escapeXmlAttribute(projectOut)}/build.gradle" />
	<merge 
		from = "res/values/strings.xml.ftl" 
		to="${escapeXmlAttribute(resOut)}/values/strings.xml"
	/>

	<merge 
		from = "res/values/dimens.xml.ftl" 
		to="${escapeXmlAttribute(resOut)}/values/dimens.xml"
	/>

	<merge 
		from = "res/values/styles.xml.ftl" 
		to="${escapeXmlAttribute(resOut)}/values/styles.xml"
	/>
	
	## Manejador Clases
	<instantiate from="logica/VistaLectorPdf.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/UtilidadesVista/VisorPDF/VistaLectorPdf.kt"/>
	<instantiate from="res/layout/view_lector_pdf.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/view_lector_pdf.xml"/>

	<instantiate from="logica/DialogoPDF.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/Dialogos/DialogoPDF.kt"/>
	<instantiate from="res/layout/dialogo_lector_pdf.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/dialogo_lector_pdf.xml"/>

	<instantiate from="logica/UtilidadesDialogoPDF.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Utilidades/DialogoPDF/UtilidadesDialogoPDF.kt"/>


</recipe>
