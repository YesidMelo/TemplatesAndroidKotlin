<?xml version="1.0"?>
<recipe>

	<!--Elementos de la base-->
    <instantiate
    	from="src/app_package/Base/BaseActivity.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Base/BaseActivity.kt"
    	/>
    <instantiate
    	from="src/app_package/Base/BaseFragment.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Base/BaseFragment.kt"
    	/>	
	<instantiate
    	from="src/app_package/Base/BaseModel.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Base/BaseModel.kt"
    	/>
	<instantiate
    	from="src/app_package/Base/IBaseBL.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Base/IBaseBL.kt"
    	/>

    <instantiate
        from="src/app_package/Base/IBaseListener.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/Base/IBaseListener.kt"
        />

    <instantiate
        from="src/app_package/Base/IBaseView.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/Base/IBaseView.kt"
        />

    <!--Elementos de Utilidades -->
	<instantiate
    	from="src/app_package/Utilidades/Constantes.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Utilidades/Constantes.kt"
    	/>
	<instantiate
    	from="src/app_package/Utilidades/Funciones.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Utilidades/Funciones.kt"
    	/>
    <!--Elementos de componenetes-->

    <instantiate
        from="src/app_package/Componentes/Dialogos/Dialogo.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/Componentes/Dialogos/Dialogo.kt"
        />

    <instantiate from="res/layout/dialogo_alerta.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/dialogo_alerta.xml"/>
    
    <instantiate
        from="src/app_package/Componentes/Progress/Progress.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/Componentes/Progress/Progress.kt"
        />
    <instantiate from="res/layout/progress.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/progress.xml"/>    

	<instantiate
    	from="src/app_package/Componentes/tmp/tmp.txt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Componentes/tmp/tmp.txt"
    	/>

    <instantiate
        from="src/app_package/Componentes/Items/Item_Adicion_Iconos_Text.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/Componentes/Items/Item_Adicion_Iconos_Text.kt"
        />

	<!--Elementos de modelo-->
	<instantiate
    	from="src/app_package/Modelos/Respuesta.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Modelos/Respuesta.kt"
    	/>
    <instantiate
        from="src/app_package/Modelos/Vacio.kt.ftl"
        to="${escapeXmlAttribute(srcOut)}/Modelos/Vacio.kt"
        />

	<!--Elementos de Presentacion-->

	<instantiate from="res/layout/activity_main.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/activity_launcher.xml"/>
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Implementacion/MiAplicacion.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Implementacion/MiAplicacion.kt"
    	/>
    <!--MVP Launcher-->
    	<!--Interfaces-->
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Interfaces/ILauncherView.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Interfaces/ILauncherView.kt"
    	/>
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Interfaces/ILauncherPresenter.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Interfaces/ILauncherPresenter.kt"
    	/>
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Interfaces/ILauncherListener.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Interfaces/ILauncherListener.kt"
    	/>
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Interfaces/ILauncherBL.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Interfaces/ILauncherBL.kt"
    	/>
    	<!--Implementations-->
<instantiate
    	from="src/app_package/Presentacion/Launcher/Implementacion/LauncherActivity.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Implementacion/LauncherActivity.kt"
    	/>
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Implementacion/LauncherPresenter.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Implementacion/LauncherPresenter.kt"
    	/>
	<instantiate
    	from="src/app_package/Presentacion/Launcher/Implementacion/LauncherBL.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Launcher/Implementacion/LauncherBL.kt"
    	/>
	
	
        <!--Layouts -->

	<instantiate from="res/layout/activity_main.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/activity_principal.xml"/>

	<instantiate
    	from="src/app_package/Presentacion/Principal/PrincipalActivity.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Presentacion/Principal/PrincipalActivity.kt"
    	/>

    <!--Elementos de los repositorios-->
    	<!--Persistencia-->
	
    <instantiate
    	from="src/app_package/Repositorios/Persistencia/Persistencia.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Repositorios/Persistencia/Persistencia.kt"
    	/>
    <!--Produccion-->
    <instantiate
    	from="src/app_package/Repositorios/Produccion/IProduccionListener.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Repositorios/Produccion/IProduccionListener.kt"
    	/>

	<instantiate
    	from="src/app_package/Repositorios/Produccion/Interfaces/IRestUsuario.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Repositorios/Produccion/Interfaces/IRestUsuario.kt"
    	/>
	
	<instantiate
    	from="src/app_package/Repositorios/Produccion/Implementacion/RestUsuario.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Repositorios/Produccion/Implementacion/RestUsuario.kt"
    	/>

	
	<instantiate
    	from="src/app_package/Repositorios/Proxy/Proxy.kt.ftl"
    	to="${escapeXmlAttribute(srcOut)}/Repositorios/Proxy/Proxy.kt"
    	/>
        
    <!--Estilos -->
    <merge from="res/values/styles.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/values/styles.xml" />
    <!--Colores -->
    <merge from="res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/values/colors.xml" />
    <!--Manifiest-->	
    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
             
	<open 
    	file="${escapeXmlAttribute(srcOut)}/Base/BaseActivity.kt" />


</recipe>
