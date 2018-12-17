<?xml version = "1.0"?>
<recipe>
	<instantiate 
		from		= "RecyclerAdapter.kt.ftl"
		to			= "${escapeXmlAttribute(srcOut)}/${Modelo}Adapter.kt"
	/>
	<instantiate
		from  		= "layout.xml.ftl"
		to			= "${escapeXmlAttribute(resOut)}/layout/item_recycler_${Modelo?lower_case}.xml"
		/>
	<open file = "${escapeXmlAttribute(srcOut)}/${Modelo}Adapter.kt" />
	<open file = "${escapeXmlAttribute(resOut)}/layout/item_recycler_${Modelo?lower_case}.xml" />

</recipe>