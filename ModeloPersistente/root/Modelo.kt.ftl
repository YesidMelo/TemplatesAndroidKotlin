package ${applicationPackage}.Modelos

import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

// srcDir: ${srcDir}
// resDir: ${resDir}
// resOut: ${resOut}
// escapeXmlAttribute(resOut) : ${escapeXmlAttribute(resOut)}/../..
@Entity
class ${modelo} {
    
    @PrimaryKey
    var ${modelo}Id :Int ?= null
    var Nombre${modelo} :String ?= null

    override fun toString(): String {
        return if (Nombre${modelo} != null) Nombre${modelo}!! else super.toString()
    }
}