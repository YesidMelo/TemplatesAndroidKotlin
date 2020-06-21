package ${packageName}.DataAccess.ProxyVolley

import com.android.volley.toolbox.HurlStack
import com.squareup.okhttp.OkHttpClient
import com.squareup.okhttp.OkUrlFactory
import java.net.HttpURLConnection
import java.net.URL

class CorreccionConsultasHttp : HurlStack() {

    private val okUrlFactory : OkUrlFactory = OkUrlFactory(OkHttpClient())

    override fun createConnection(url: URL?): HttpURLConnection {
        return okUrlFactory.open(url)
    }


}