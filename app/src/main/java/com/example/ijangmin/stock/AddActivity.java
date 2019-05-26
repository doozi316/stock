package com.example.ijangmin.stock;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * Created by user on 2019-05-26.
 */

public class AddActivity extends AppCompatActivity {

    // 현재시간을 msec 으로 구한다.
    long now = System.currentTimeMillis();
    // 현재시간을 date 변수에 저장한다.
    Date date = new Date(now);
    // 시간을 나타냇 포맷을 정한다 ( yyyy/MM/dd 같은 형태로 변형 가능 )
    SimpleDateFormat sdfNow = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    // nowDate 변수에 값을 저장한다.
    String formatDate = sdfNow.format(date);



    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add);

        final EditText pNum =(EditText)findViewById(R.id.pNum);
        final EditText setDate = (EditText)findViewById(R.id.setDate);
        final EditText pName = (EditText)findViewById(R.id.pName);
        final EditText pManu = (EditText)findViewById(R.id.pManu);
        Button addBtn = (Button)findViewById(R.id.addBtn);
        setDate.setText(formatDate);

        Intent intent2 = getIntent();

        String re = intent2.getExtras().getString("re");
        pNum.setText(re);

        addBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String productNum = pNum.getText().toString();
                String productName = pName.getText().toString();
                String productManu = pManu.getText().toString();
                String productDate = setDate.getText().toString();


                //4. 콜백 처리부분(volley 사용을 위한 ResponseListener 구현 부분)
                Response.Listener<String> responseListener = new Response.Listener<String>(){

                    //서버로부터 여기서 데이터를 받음
                    @Override
                    public void onResponse(String response) {
                        try {
                            //서버로부터 받는 데이터는 JSON타입의 객체이다.
                            JSONObject jsonResponse = new JSONObject(response);
                            //그중 Key값이 "success"인 것을 가져온다.
                            boolean success = jsonResponse.getBoolean("success");

                            //저장 성공시 success값이 true임
                            if(success){

                                Toast.makeText(getApplicationContext(), "success", Toast.LENGTH_SHORT).show();

                                //알림상자를 만들어서 보여줌
                                AlertDialog.Builder builder = new AlertDialog.Builder(AddActivity.this);
                                builder.setMessage("Add success!!")
                                        .setPositiveButton("ok", null)
                                        .create()
                                        .show();

                                //그리고 첫화면으로 돌아감
                                Intent intent = new Intent(AddActivity.this, MainActivity.class);
                               AddActivity.this.startActivity(intent);

                            }
                            //저장 실패시 success값이 false임
                            else{
                                Toast.makeText(getApplicationContext(), "fail", Toast.LENGTH_SHORT).show();

                                //알림상자를 만들어서 보여줌
                                AlertDialog.Builder builder = new AlertDialog.Builder(AddActivity.this);
                                builder.setMessage("Add fail!!")
                                        .setNegativeButton("ok", null)
                                        .create()
                                        .show();

                            }

                        }catch(JSONException e){
                            e.printStackTrace();
                        }

                    }
                };//responseListener 끝

                //volley 사용법
                //1. RequestObject를 생성한다. 이때 서버로부터 데이터를 받을 responseListener를 반드시 넘겨준다.
                AddRequest addRequest = new AddRequest(productName, productNum, productManu, productDate, responseListener);
                //2. RequestQueue를 생성한다.
                RequestQueue queue = Volley.newRequestQueue(AddActivity.this);
                //3. RequestQueue에 RequestObject를 넘겨준다.
                queue.add(addRequest);

            }
        });
    }



}
