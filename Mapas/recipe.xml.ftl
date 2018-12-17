<?xml version="1.0"?>
<recipe>
	<#if Ingles == false>
	<instantiate
		from 	=	"MapaOffline.kt.ftl"
		to		= 	"${escapeXmlAttribute(srcOut)}/ContenedorMapas.kt"
		/>
	<open file = "${escapeXmlAttribute(srcOut)}/ContenedorMapas.kt"/>
	<#else>

	</#if>
</recipe>