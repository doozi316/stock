package com.example.ijangmin.stock;

import com.android.volley.AuthFailureError;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by user on 2019-05-26.
 */

public class AddRequest extends StringRequest{

    final static private String URL = "http://10.0.2.2:8080/Add.php";
    private Map<String, String> parameters;

    //생성자
    public AddRequest(String productName, String productNum, String productManu, String productDate, Response.Listener<String> listener){
        super(Method.POST, URL, listener, null);
        parameters = new HashMap<>();
        parameters.put("productName", productName);
        parameters.put("productNum", productNum);
        parameters.put("productManu", productManu);
        parameters.put("productDate", productDate);

    }

    //추후 사용을 위한 부분
    @Override
    protected Map<String, String> getParams() throws AuthFailureError {
        return parameters;
    }
}
