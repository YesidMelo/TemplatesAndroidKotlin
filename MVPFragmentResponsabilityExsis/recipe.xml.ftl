<?xml version="1.0"?>
<recipe>
    	
	<instantiate from="src/app_package/Interfaces/IView.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Interfaces/I${responsability}View.kt"/>

	<instantiate from="src/app_package/Interfaces/IPresenter.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Interfaces/I${responsability}Presenter.kt"/>

	<instantiate from="src/app_package/Interfaces/IListener.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Interfaces/I${responsability}Listener.kt"/>

	<instantiate from="src/app_package/Interfaces/IBL.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Interfaces/I${responsability}BL.kt"/>

	<instantiate from="src/app_package/Implementacion/MainBL.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Implementacion/${responsability}BL.kt"/>

	<instantiate from="src/app_package/Implementacion/MainPresenter.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Implementacion/${responsability}Presenter.kt"/>

	<instantiate from="src/app_package/Implementacion/MainFragment.kt.ftl" to="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Implementacion/${fragmentClass}.kt"/>
	
	<instantiate from="res/layout/activity_main.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml"/>
	
    <open file="${escapeXmlAttribute(srcOut)}/Presentacion/${responsability}/Implementacion/${fragmentClass}.kt" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
</recipe>
