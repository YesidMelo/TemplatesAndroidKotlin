<?xml version="1.0"?>
<recipe>
	<instantiate 
		from 	=	"Modelo.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/${modelo}.kt"
	/>
	<instantiate 
		from 	=	"RepoModelo.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/../Repositorios/Produccion/Repo${modelo}.kt"
	/>
	<instantiate 
		from 	=	"ModeloDao.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/../Repositorios/Persistencia/Daos/${modelo}Dao.kt"
	/>
	<#if crearConsultorBaseDatos  == true>
	<instantiate 
		from 	=	"BaseDatos.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/../Repositorios/Persistencia/BaseDatos.kt"
	/>
	<instantiate 
		from 	=	"Migraciones.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/../Repositorios/Persistencia/Migraciones.kt"
	/>
	<instantiate 
		from 	=	"ConversorFecha.kt.ftl"
		to 		= 	"${escapeXmlAttribute(srcOut)}/../Repositorios/Persistencia/Conversores/ConversorFecha.kt"
	/>
	</#if>

</recipe>