<?xml version ="1.0"?>
<recipe>
    <instantiate
            from="dialogo_alerta.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/layout/dialogo_alerta.xml"
            />
    <instantiate 
		from 	=	"DialogoAlerta.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/Componentes/DialogoAlerta.kt"
	/>
	<merge
		from	=	"build.gradle.ftl"
		to		=	"${escapeXmlAttribute(projectOut)}/build.gradle"
		/>
    
</recipe>