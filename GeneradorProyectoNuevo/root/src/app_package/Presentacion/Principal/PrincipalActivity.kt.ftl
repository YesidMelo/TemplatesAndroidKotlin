package ${packageName}.Presentacion.Principal

import android.os.Bundle
import android.widget.FrameLayout

import ${packageName}.Base.BaseActivity
import ${packageName}.R


/**
 * Created by Yesid on 21/08/2017.
 */

class PrincipalActivity : BaseActivity() {
    
   
    override fun onCreate(savedInstanceState:Bundle?) {
        setContentView(R.layout.activity_principal)
        super.onCreate(savedInstanceState)
    }


}
